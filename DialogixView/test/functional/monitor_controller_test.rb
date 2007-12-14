require File.dirname(__FILE__) + '/../test_helper'
require 'monitor_controller'

# Re-raise errors caught by the controller.
class MonitorController; def rescue_action(e) raise e end; end

class MonitorControllerTest < Test::Unit::TestCase
  fixtures :dialogix_user

  def setup
    @controller = MonitorController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = dialogix_users(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:dialogix_users)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:dialogix_user)
    assert assigns(:dialogix_user).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:dialogix_user)
  end

  def test_create
    num_dialogix_users = DialogixUser.count

    post :create, :dialogix_user => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_dialogix_users + 1, DialogixUser.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:dialogix_user)
    assert assigns(:dialogix_user).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      DialogixUser.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      DialogixUser.find(@first_id)
    }
  end
end
