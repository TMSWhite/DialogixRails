require File.dirname(__FILE__) + '/../test_helper'

class PageUsagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:page_usages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_page_usage
    assert_difference('PageUsage.count') do
      post :create, :page_usage => { }
    end

    assert_redirected_to page_usage_path(assigns(:page_usage))
  end

  def test_should_show_page_usage
    get :show, :id => page_usages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => page_usages(:one).id
    assert_response :success
  end

  def test_should_update_page_usage
    put :update, :id => page_usages(:one).id, :page_usage => { }
    assert_redirected_to page_usage_path(assigns(:page_usage))
  end

  def test_should_destroy_page_usage
    assert_difference('PageUsage.count', -1) do
      delete :destroy, :id => page_usages(:one).id
    end

    assert_redirected_to page_usages_path
  end
end
