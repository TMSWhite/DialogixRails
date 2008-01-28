require File.dirname(__FILE__) + '/../test_helper'

class DialogixUsersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dialogix_users)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_dialogix_user
    assert_difference('DialogixUser.count') do
      post :create, :dialogix_user => { }
    end

    assert_redirected_to dialogix_user_path(assigns(:dialogix_user))
  end

  def test_should_show_dialogix_user
    get :show, :id => dialogix_users(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => dialogix_users(:one).id
    assert_response :success
  end

  def test_should_update_dialogix_user
    put :update, :id => dialogix_users(:one).id, :dialogix_user => { }
    assert_redirected_to dialogix_user_path(assigns(:dialogix_user))
  end

  def test_should_destroy_dialogix_user
    assert_difference('DialogixUser.count', -1) do
      delete :destroy, :id => dialogix_users(:one).id
    end

    assert_redirected_to dialogix_users_path
  end
end
