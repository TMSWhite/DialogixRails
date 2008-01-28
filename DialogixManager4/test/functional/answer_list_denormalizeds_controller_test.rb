require File.dirname(__FILE__) + '/../test_helper'

class AnswerListDenormalizedsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_list_denormalizeds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_answer_list_denormalized
    assert_difference('AnswerListDenormalized.count') do
      post :create, :answer_list_denormalized => { }
    end

    assert_redirected_to answer_list_denormalized_path(assigns(:answer_list_denormalized))
  end

  def test_should_show_answer_list_denormalized
    get :show, :id => answer_list_denormalizeds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => answer_list_denormalizeds(:one).id
    assert_response :success
  end

  def test_should_update_answer_list_denormalized
    put :update, :id => answer_list_denormalizeds(:one).id, :answer_list_denormalized => { }
    assert_redirected_to answer_list_denormalized_path(assigns(:answer_list_denormalized))
  end

  def test_should_destroy_answer_list_denormalized
    assert_difference('AnswerListDenormalized.count', -1) do
      delete :destroy, :id => answer_list_denormalizeds(:one).id
    end

    assert_redirected_to answer_list_denormalizeds_path
  end
end
