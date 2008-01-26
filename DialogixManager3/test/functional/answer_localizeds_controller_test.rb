require File.dirname(__FILE__) + '/../test_helper'

class AnswerLocalizedsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_localizeds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_answer_localized
    assert_difference('AnswerLocalized.count') do
      post :create, :answer_localized => { }
    end

    assert_redirected_to answer_localized_path(assigns(:answer_localized))
  end

  def test_should_show_answer_localized
    get :show, :id => answer_localizeds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => answer_localizeds(:one).id
    assert_response :success
  end

  def test_should_update_answer_localized
    put :update, :id => answer_localizeds(:one).id, :answer_localized => { }
    assert_redirected_to answer_localized_path(assigns(:answer_localized))
  end

  def test_should_destroy_answer_localized
    assert_difference('AnswerLocalized.count', -1) do
      delete :destroy, :id => answer_localizeds(:one).id
    end

    assert_redirected_to answer_localizeds_path
  end
end
