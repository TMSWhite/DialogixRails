require File.dirname(__FILE__) + '/../test_helper'

class InstrumentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instruments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instrument
    assert_difference('Instrument.count') do
      post :create, :instrument => { }
    end

    assert_redirected_to instrument_path(assigns(:instrument))
  end

  def test_should_show_instrument
    get :show, :id => instruments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instruments(:one).id
    assert_response :success
  end

  def test_should_update_instrument
    put :update, :id => instruments(:one).id, :instrument => { }
    assert_redirected_to instrument_path(assigns(:instrument))
  end

  def test_should_destroy_instrument
    assert_difference('Instrument.count', -1) do
      delete :destroy, :id => instruments(:one).id
    end

    assert_redirected_to instruments_path
  end
end
