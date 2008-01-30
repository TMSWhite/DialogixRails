require File.dirname(__FILE__) + '/../test_helper'

class DisplayTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:display_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_display_type
    assert_difference('DisplayType.count') do
      post :create, :display_type => { }
    end

    assert_redirected_to display_type_path(assigns(:display_type))
  end

  def test_should_show_display_type
    get :show, :id => display_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => display_types(:one).id
    assert_response :success
  end

  def test_should_update_display_type
    put :update, :id => display_types(:one).id, :display_type => { }
    assert_redirected_to display_type_path(assigns(:display_type))
  end

  def test_should_destroy_display_type
    assert_difference('DisplayType.count', -1) do
      delete :destroy, :id => display_types(:one).id
    end

    assert_redirected_to display_types_path
  end
end
