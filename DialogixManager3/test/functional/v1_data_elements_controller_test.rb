require File.dirname(__FILE__) + '/../test_helper'

class V1DataElementsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:v1_data_elements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_v1_data_element
    assert_difference('V1DataElement.count') do
      post :create, :v1_data_element => { }
    end

    assert_redirected_to v1_data_element_path(assigns(:v1_data_element))
  end

  def test_should_show_v1_data_element
    get :show, :id => v1_data_elements(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => v1_data_elements(:one).id
    assert_response :success
  end

  def test_should_update_v1_data_element
    put :update, :id => v1_data_elements(:one).id, :v1_data_element => { }
    assert_redirected_to v1_data_element_path(assigns(:v1_data_element))
  end

  def test_should_destroy_v1_data_element
    assert_difference('V1DataElement.count', -1) do
      delete :destroy, :id => v1_data_elements(:one).id
    end

    assert_redirected_to v1_data_elements_path
  end
end
