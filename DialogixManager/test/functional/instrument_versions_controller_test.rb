require File.dirname(__FILE__) + '/../test_helper'

class InstrumentVersionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instrument_version)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instrument_version
    assert_difference('InstrumentVersion.count') do
      post :create, :instrument_version => { }
    end

    assert_redirected_to instrument_version_path(assigns(:instrument_version))
  end

  def test_should_show_instrument_version
    get :show, :id => instrument_version(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instrument_version(:one).id
    assert_response :success
  end

  def test_should_update_instrument_version
    put :update, :id => instrument_version(:one).id, :instrument_version => { }
    assert_redirected_to instrument_version_path(assigns(:instrument_version))
  end

  def test_should_destroy_instrument_version
    assert_difference('InstrumentVersion.count', -1) do
      delete :destroy, :id => instrument_version(:one).id
    end

    assert_redirected_to instrument_version_path
  end
end
