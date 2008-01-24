# jMaki Server Runtime for Ruby
# Version : 0.9.8
#
# Authors : Criag McClanahan
#           Greg Murray

module JmakiCoreHelper

  # ---------- Global Constants ----------

  JMAKI_RESOURCES = "public/resources/"
  @jmakiGlobalTheme = nil

  # ---------- Global jMaki Methods ----------

  # Render the JavaScript to set up the jMaki page environment
  def jmaki_setup

    # Configure global variables as needed
    # FIXME - next three lines are a real hack
    railsURI = request.request_uri                 # Usually just /controller/action
    requestURI = request.env['REQUEST_URI']        # Entire absolute URI
    webRoot = requestURI[0, (requestURI.length - railsURI.length)]
    result = "<script type='text/javascript'>\n" +
      "  jmaki.webRoot = '" + webRoot + "';\n" +
      "  jmaki.resourcesRoot = '/resources';\n" +
      "  jmaki.xhp = '" + webRoot + "/xhp';\n" +
      "</script>\n"

    # Load global configuration
    global = jmaki_load_global()

    # Render glue includes as necessary
    config = global['config']
    if config
      glue = config['glue']
      if glue
        includes = glue['includes']
        if includes
          for i in 0...includes.length
            include = includes[i]
            if include.instance_of?(String)
              result += jmaki_generate_js(include)
            elsif include.instance_of?(Hash)
              lib = include['lib']
              url = include['url']
              if lib && url && jmaki_match_url(url)
                result += jmaki_generate_js(lib)
              end
            end
          end
        end
      end
      if config['globalTheme']
       @jmakiGlobalTheme = config['globalTheme']
      end      
    end

    # Return the accumulated result
    result

  end

  # Render the JavaScript call to set up the jMaki widget specified by
  # "name", and to include any necessary resources that have not yet been
  # downloaded for the current page.  The "options" parameter represents a
  # hash of values used to configure the behavior of this widget.  Consult
  # the jMaki documentation for legal values and options
  def jmaki_widget(name, options = {})

    # Set up variables we will need
    result = ""
    nameSlashed = name.tr('.', '/')
    widgetDir = "/resources/" + nameSlashed # FIXME - relative to context path?

    # Decorate the options hash with our required attributes
    options['name'] = name
    if !options['uuid']
      options['uuid'] = jmaki_generate_uuid(name)
    end
    options['widgetDir'] = widgetDir
#    puts "options = " + options.inspect    

    # Render the widget-specific libraries and stylesheets
    widget = jmaki_load_widget(name)
#    puts "Loaded data is " + widget.inspect
    config = widget['config']
    if config
      type = config['type']
      if type
        id = type['id']
        if ((id != nil) && !jmaki_type_include?(id))
          # preload
          preload = type['preload']
          if preload
            result += jmaki_generate_script(preload)
          end
          #apikey
          apikey = type['apikey']
          gkeys = config['apikeys']
          if !apikey
            apikey = ""
          elsif gkeys
            for i in 0...gkeys.length 
              # check if we have a global apikey ex. google
              if gkeys[i]['id'] == apikey
                urlkeys = gkeys[i]['keys'];
                # check if we can match the url to one of the keys
                #FIXME -use global variables to compute the webRoot
                railsURI = request.request_uri  
                requestURI = request.env['REQUEST_URI'] 
                webRoot = requestURI[0, (requestURI.length - railsURI.length)] + "/"
                for i in 0...urlkeys.length 
                  # check the apikey against the webRoot and account for wildcards
                  if urlkeys[i]['url'] == webRoot || urlkeys[i]['url'] == '*'
                    # set the key equal to the new apikey
                    apikey = urlkeys[i]['key']
                  end
                end
              end     
            end 
          end
          # libs
          libs = type['libs']
          dynamicallyLoadable = type['dynamicallyLoadable']
          if libs
            for i in 0...libs.length
              scriptName = ""
              # if the lib starts with http don't add the widget dir
              if libs[i].match(/^http/)
                scriptName = libs[i] + apikey
              else
                scriptName = widgetDir + "/" + libs[i] + apikey
              end    
              # use jmaki script loader when dynamicallyLoadable is false
              # the uuid is needed to identify the widget to the end user
              if dynamicallyLoadable != nil && !dynamicallyLoadable
                script = "jmaki.writeScript('" + scriptName +  "','" + options['uuid'] + "');"
                result += jmaki_generate_script(script)
              else 
                result += jmaki_generate_js(scriptName)
              end
            end
          end
          # postload
          postload = type['postload']
          if postload
            result += jmaki_generate_script(postload)
          end
          # themes
          themes = type['themes']
          if themes
            defaultTheme = nil
            for i in 0...themes.length
              # check each theme if its the default. Last one with default wins
              if @jmakiGlobalTheme && themes[i]['id']
                if @jmakiGlobalTheme == themes[i]['id']
                  theme =  themes[i]['style']
                end
              end
              if themes[i]['default']
                defaultTheme = themes[i]['style']     
              end
            end
            if theme == nil
              theme = defaultTheme                            
            end

            if theme
              if theme.match(/^http/)
                result += jmaki_generate_css(theme)
              else
                result += jmaki_generate_css(widgetDir + "/" + theme)
              end
            end            
          end          
          # styles
          styles = type['styles']
          if styles
            for i in 0...styles.length
              if styles[i].match(/^http/)
                 result += jmaki_generate_css(styles[i])
              else
                result += jmaki_generate_css(widgetDir + "/" + styles[i])
              end  
            end
          end
          jmaki_type_include(id)
        end
      end
    end

    # Render link to widget stylesheet (if any)
    # FIXME - allow "component.css" override with "style" attribute
    if (File.exist?(JMAKI_RESOURCES + nameSlashed + "/component.css"))
      result += jmaki_generate_css(widgetDir + "/component.css")
    end

    # Render link to widget javascript (assumed to exist)
    # FIXME - allow "component.js" override with "script" attribute
    result += jmaki_generate_js(widgetDir + "/component.js")

    # Create an empty options hash if we did not receive one
    if !options
      options = { }
    end

    # Deal with the widget template (if any), including parameter replacements
    # FIXME - override local filename with "template" attribute
    template = nil
    templateFilename = JMAKI_RESOURCES + nameSlashed + "/component.htm"
    if (File.exist?(templateFilename))
      template = jmaki_generate_content(templateFilename)
    elsif (File.exist?(templateFilename + "l"))
      template = jmaki_generate_content(templateFilename + "l")
    end
    if template
      # FIXME - do substitutions in writeTemplate() other than ${uuid}
      template = template.gsub('${uuid}', options['uuid'])
      result += template
    end

#    puts "OPTIONS=" + options.to_json

    # Render the widget constructor call
    result += "<script type='text/javascript'>\n" +
      "  jmaki.addWidget(" + options.to_json + ");\n" +
      "</script>\n"

    # Return the completed result
    result

  end

  # ---------- Support Methods ----------

  private

  # Resources for which we have already emitted a reference
  @jmaki_resources

  # Load and return the content of the specified text file
  # FIXME - cache to avoid loading every single time
  def jmaki_generate_content(filename)
    content = ""
    File.open(filename, "r") do |file|
      while line = file.gets(nil)
        content += line
      end
    end
    content
  end

  # If we have not yet done so on this page, return a link to the specified
  # stylesheet resource.  Otherwise, return an empty string.
  def jmaki_generate_css(resource)
    if (@jmaki_resources == nil)
      @jmaki_resources = Array.new
    end
    if (@jmaki_resources.include?(resource))
      return ""
    end
    @jmaki_resources << resource
    "<link type='text/css' rel='stylesheet' href='" + resource + "'></link>\n"
  end

  # If we have not yet done so on this page, return a link to the specified
  # javascript resource.  Otherwise, return an empty string.
  def jmaki_generate_js(resource)
    if (@jmaki_resources == nil)
      @jmaki_resources = Array.new
    end
    if (@jmaki_resources.include?(resource))
      return ""
    end
    @jmaki_resources << resource
    "<script type='text/javascript' src='" + resource + "'></script>\n"
  end

  # Generate an inline Javascript expressino
  def jmaki_generate_script(script)
    "<script type='text/javascript'>" + script + "</script>\n"
  end

  # Last UUID generated
  @jmaki_uuid
  
  # Return a UUID for this widget.
  def jmaki_generate_uuid(name)
    if (@jmaki_uuid == nil)
      @jmaki_uuid = 0
    end
    @jmaki_uuid = @jmaki_uuid + 1
    return name.tr('.', '_') + "_" + @jmaki_uuid.to_s;
  end

  # The parsed config.json object
  @jmaki_global

  # Parse and return the global config.json content for this application.
  # If there is no such resource, return an empty object literal instead.
  def jmaki_load_global()
    if !@jmaki_global
      filename = JMAKI_RESOURCES + "config.json"
      if File.exist?(filename)
        content = ""
        File.open(filename, "r") do |file|
          while line = file.gets(nil)
            content += line
          end
        end
        @jmaki_global = jmaki_parse_json(content, filename)
      else
        @jmaki_global = { }
      end
    end
    @jmaki_global
  end

  # Hash of parsed widget.json files, keyed by widget name
  @jmaki_widgets

  # Parse and return the widget.json content for the specified widget name
  def jmaki_load_widget(name)
    # Return previously parsed content (if any)
    if !@jmaki_widgets
      @jmaki_widgets = { }
    end
    previous = @jmaki_widgets[name]
    if previous
      return previous
    end
    content = ""
    filename = JMAKI_RESOURCES + name.tr('.', '/') + "/widget.json"
    File.open(filename, "r") do |file|
      while line = file.gets(nil)
        content += line
      end
    end
    current = jmaki_parse_json(content, filename)
    @jmaki_widgets[name] = current
    current
  end

  # Return true if the context relative part of our request URL matches
  # the specified pattern exactly, or the pattern is the '*' wildcard
  def jmaki_match_url(pattern)
    (pattern == '*') or (request.request_uri == pattern)
  end

  # Parse and return the specified JSON input into a Ruby object structure
  # http://rubyforge.org/snippet/detail.php?type=snippet&id=29
  def jmaki_parse_json(input, filename)
    eval(input.gsub(/(["'])\s*:\s*(['"-?0-9tfn\[{])/){"#{$1}=>#{$2}"}, binding, filename)
  rescue
    return nil
  end

  # Types we have already processed
  @jmaki_types

  # Include the specified type as one we have processed already
  def jmaki_type_include(type)
    if (@jmaki_types == nil)
      @jmaki_types = Array.new
    end
    @jmaki_types << type
  end

  # Return true if we have already processed the specified type
  def jmaki_type_include?(type)
    if (@jmaki_types == nil)
      @jmaki_types = Array.new
    end
    return @jmaki_types.include?(type)
  end

end
