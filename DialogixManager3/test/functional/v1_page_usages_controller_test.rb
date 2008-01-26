require File.dirname(__FILE__) + '/../test_helper'

class V1PageUsagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:v1_page_usages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_v1_page_usage
    assert_difference('V1PageUsage.count') do
      post :create, :v1_page_usage => { }
    end

    assert_redirected_to v1_page_usage_path(assigns(:v1_page_usage))
  end

  def test_should_show_v1_page_usage
    get :show, :id => v1_page_usages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => v1_page_usages(:one).id
    assert_response :success
  end

  def test_should_update_v1_page_usage
    put :update, :id => v1_page_usages(:one).id, :v1_page_usage => { }
    assert_redirected_to v1_page_usage_path(assigns(:v1_page_usage))
  end

  def test_should_destroy_v1_page_usage
    assert_difference('V1PageUsage.count', -1) do
      delete :destroy, :id => v1_page_usages(:one).id
    end

    assert_redirected_to v1_page_usages_path
  end
end
