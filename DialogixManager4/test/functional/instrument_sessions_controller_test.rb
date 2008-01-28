require File.dirname(__FILE__) + '/../test_helper'

class InstrumentSessionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instrument_sessions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instrument_session
    assert_difference('InstrumentSession.count') do
      post :create, :instrument_session => { }
    end

    assert_redirected_to instrument_session_path(assigns(:instrument_session))
  end

  def test_should_show_instrument_session
    get :show, :id => instrument_sessions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instrument_sessions(:one).id
    assert_response :success
  end

  def test_should_update_instrument_session
    put :update, :id => instrument_sessions(:one).id, :instrument_session => { }
    assert_redirected_to instrument_session_path(assigns(:instrument_session))
  end

  def test_should_destroy_instrument_session
    assert_difference('InstrumentSession.count', -1) do
      delete :destroy, :id => instrument_sessions(:one).id
    end

    assert_redirected_to instrument_sessions_path
  end
end
