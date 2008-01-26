require File.dirname(__FILE__) + '/../test_helper'

class PageUsageEventsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:page_usage_events)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_page_usage_event
    assert_difference('PageUsageEvent.count') do
      post :create, :page_usage_event => { }
    end

    assert_redirected_to page_usage_event_path(assigns(:page_usage_event))
  end

  def test_should_show_page_usage_event
    get :show, :id => page_usage_events(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => page_usage_events(:one).id
    assert_response :success
  end

  def test_should_update_page_usage_event
    put :update, :id => page_usage_events(:one).id, :page_usage_event => { }
    assert_redirected_to page_usage_event_path(assigns(:page_usage_event))
  end

  def test_should_destroy_page_usage_event
    assert_difference('PageUsageEvent.count', -1) do
      delete :destroy, :id => page_usage_events(:one).id
    end

    assert_redirected_to page_usage_events_path
  end
end
