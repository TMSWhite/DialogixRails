require File.dirname(__FILE__) + '/../test_helper'

class EntryInstrumentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_instruments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_entry_instrument
    assert_difference('EntryInstrument.count') do
      post :create, :entry_instrument => { }
    end

    assert_redirected_to entry_instrument_path(assigns(:entry_instrument))
  end

  def test_should_show_entry_instrument
    get :show, :id => entry_instruments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => entry_instruments(:one).id
    assert_response :success
  end

  def test_should_update_entry_instrument
    put :update, :id => entry_instruments(:one).id, :entry_instrument => { }
    assert_redirected_to entry_instrument_path(assigns(:entry_instrument))
  end

  def test_should_destroy_entry_instrument
    assert_difference('EntryInstrument.count', -1) do
      delete :destroy, :id => entry_instruments(:one).id
    end

    assert_redirected_to entry_instruments_path
  end
end
