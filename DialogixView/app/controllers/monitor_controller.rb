class MonitorController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @dialogix_user_pages, @dialogix_users = paginate :dialogix_users, :per_page => 10
  end

  def show
    @dialogix_user = DialogixUser.find(params[:id])
    @dialogix_user_sessions = @dialogix_user.instrument_session.collect
    
    flash[:dialogixUser_id] = @dialogix_user.id
  end

  def new
    @dialogix_user = DialogixUser.new
  end

  def create
    @dialogix_user = DialogixUser.new(params[:dialogix_user])
    if @dialogix_user.save
      flash[:notice] = 'DialogixUser was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @dialogix_user = DialogixUser.find(params[:id])
  end

  def update
    @dialogix_user = DialogixUser.find(params[:id])
    if @dialogix_user.update_attributes(params[:dialogix_user])
      flash[:notice] = 'DialogixUser was successfully updated.'
      redirect_to :action => 'show', :id => @dialogix_user
    else
      render :action => 'edit'
    end
  end

  def destroy
    DialogixUser.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
