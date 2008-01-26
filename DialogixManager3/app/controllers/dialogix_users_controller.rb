class DialogixUsersController < ApplicationController
  active_scaffold :dialogix_user do |config|
    config.list.columns = [:user_name, :first_name, :last_name, :email, :instrument_sessions] 
    config.columns[:user_name].label = "User Name"
    
    #config.columns[:email].inplace_edit = true
    config.list.sorting = [{:user_name => :ASC}]        
  end
  # GET /dialogix_users
  # GET /dialogix_users.xml
  #def index
  #  @dialogix_users = DialogixUser.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @dialogix_users }
  #  end
  #end

  # GET /dialogix_users/1
  # GET /dialogix_users/1.xml
  def show_rest
    @dialogix_user = DialogixUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dialogix_user }
    end
  end

  # GET /dialogix_users/new
  # GET /dialogix_users/new.xml
  def new_rest
    @dialogix_user = DialogixUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dialogix_user }
    end
  end

  # GET /dialogix_users/1/edit
  def edit_rest
    @dialogix_user = DialogixUser.find(params[:id])
  end

  # POST /dialogix_users
  # POST /dialogix_users.xml
  def create_rest
    @dialogix_user = DialogixUser.new(params[:dialogix_user])

    respond_to do |format|
      if @dialogix_user.save
        flash[:notice] = 'DialogixUser was successfully created.'
        format.html { redirect_to(@dialogix_user) }
        format.xml  { render :xml => @dialogix_user, :status => :created, :location => @dialogix_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dialogix_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dialogix_users/1
  # PUT /dialogix_users/1.xml
  def update_rest
    @dialogix_user = DialogixUser.find(params[:id])

    respond_to do |format|
      if @dialogix_user.update_attributes(params[:dialogix_user])
        flash[:notice] = 'DialogixUser was successfully updated.'
        format.html { redirect_to(@dialogix_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dialogix_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dialogix_users/1
  # DELETE /dialogix_users/1.xml
  def destroy_rest
    @dialogix_user = DialogixUser.find(params[:id])
    @dialogix_user.destroy

    respond_to do |format|
      format.html { redirect_to(dialogix_users_url) }
      format.xml  { head :ok }
    end
  end
end
