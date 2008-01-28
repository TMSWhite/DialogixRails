require File.dirname(__FILE__) + '/../test_helper'

class V1InstrumentSessionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:v1_instrument_sessions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_v1_instrument_session
    assert_difference('V1InstrumentSession.count') do
      post :create, :v1_instrument_session => { }
    end

    assert_redirected_to v1_instrument_session_path(assigns(:v1_instrument_session))
  end

  def test_should_show_v1_instrument_session
    get :show, :id => v1_instrument_sessions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => v1_instrument_sessions(:one).id
    assert_response :success
  end

  def test_should_update_v1_instrument_session
    put :update, :id => v1_instrument_sessions(:one).id, :v1_instrument_session => { }
    assert_redirected_to v1_instrument_session_path(assigns(:v1_instrument_session))
  end

  def test_should_destroy_v1_instrument_session
    assert_difference('V1InstrumentSession.count', -1) do
      delete :destroy, :id => v1_instrument_sessions(:one).id
    end

    assert_redirected_to v1_instrument_sessions_path
  end
end
