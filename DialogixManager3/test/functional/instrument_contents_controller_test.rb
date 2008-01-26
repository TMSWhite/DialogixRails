require File.dirname(__FILE__) + '/../test_helper'

class InstrumentContentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instrument_contents)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instrument_content
    assert_difference('InstrumentContent.count') do
      post :create, :instrument_content => { }
    end

    assert_redirected_to instrument_content_path(assigns(:instrument_content))
  end

  def test_should_show_instrument_content
    get :show, :id => instrument_contents(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instrument_contents(:one).id
    assert_response :success
  end

  def test_should_update_instrument_content
    put :update, :id => instrument_contents(:one).id, :instrument_content => { }
    assert_redirected_to instrument_content_path(assigns(:instrument_content))
  end

  def test_should_destroy_instrument_content
    assert_difference('InstrumentContent.count', -1) do
      delete :destroy, :id => instrument_contents(:one).id
    end

    assert_redirected_to instrument_contents_path
  end
end
