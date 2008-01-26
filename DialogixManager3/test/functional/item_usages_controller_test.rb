require File.dirname(__FILE__) + '/../test_helper'

class ItemUsagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:item_usages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_item_usage
    assert_difference('ItemUsage.count') do
      post :create, :item_usage => { }
    end

    assert_redirected_to item_usage_path(assigns(:item_usage))
  end

  def test_should_show_item_usage
    get :show, :id => item_usages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => item_usages(:one).id
    assert_response :success
  end

  def test_should_update_item_usage
    put :update, :id => item_usages(:one).id, :item_usage => { }
    assert_redirected_to item_usage_path(assigns(:item_usage))
  end

  def test_should_destroy_item_usage
    assert_difference('ItemUsage.count', -1) do
      delete :destroy, :id => item_usages(:one).id
    end

    assert_redirected_to item_usages_path
  end
end
