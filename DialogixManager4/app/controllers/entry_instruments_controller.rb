class EntryInstrumentsController < ApplicationController
  require 'fastercsv'
  active_scaffold :entry_instrument do |config|
    #config.actions << :sortable
    config.actions.exclude :delete
    # Link for all lists
    #config.action_links.add 'Submit', :label => 'Export to Server', :page => true
    config.columns[:name].label = "Name"
    # Instrument create form edits group
    config.create.columns = [:name, :version, :instrument_description, :entry_items] 
    # Instrument update form edits group
    config.update.columns = [:name, :version, :instrument_description, :entry_items]  
    config.list.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    # Below sets a link in the last column
    config.action_links.add 'submit_to_dialogix', :label => 'Submit', :type => :record, :page => true
    config.export.columns = [:name, :version, :instrument_description, :created_on, :entry_items] 
    config.export.default_deselected_columns = [ :updated_on ]
    config.export.default_delimiter = ','
    config.export.force_quotes = true
    config.list.sorting = [{:name => :ASC}]   
  end 
   
  # Called from ActiveScaffold submit action link 
  def submit_to_dialogix
    @entry_instrument = EntryInstrument.find(params[:id])
    fcsv_options = {
      :row_sep => "\n",
      :col_sep => "\t",
      :force_quotes => false     
    }
    # Init append string
    @dialogix_content = FasterCSV.generate(fcsv_options) do |csv|
      #csv << ["Name", "Version"]
      @entry_instrument.entry_items.each do |items|
        @answerListString = items.display_type.name
        items.entry_answers.each do |answers|
          @answerListString << '|'
          @answerListString << answers['answer_code']
          @answerListString << '|'
          @answerListString << answers['name']  
        end        
        csv << [items['name'],
          items['relevance'],
          items['question'],
          @answerListString
        ]
      end
    end
    # puts @dialogix_content
    # HTTP Post to Dialogix
    csv()
    
  end
  
  def csv
    url = URI.parse('http://localhost:7070/Dialogix/LoadInstrument-Ruby.jsp')
    req = Net::HTTP::Post.new(url.path)
    req.set_form_data({'title'=>@entry_instrument.name,
        'version'=> @entry_instrument.version,
        'contents'=> @dialogix_content})    
    res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      # OK
      @result = res.body  
    else
      @result = res.error!
    end   
   
  end 
    
  def download_tsv
    @entry_instrument = EntryInstrument.find(params[:id])
    respond_to do |format|
      format.tsv  { render :tsv => @entry_instrument}
    end
  end
  
  
 
end
