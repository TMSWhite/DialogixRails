require File.dirname(__FILE__) + '/../test_helper'

class QuestionLocalizedsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:question_localizeds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_question_localized
    assert_difference('QuestionLocalized.count') do
      post :create, :question_localized => { }
    end

    assert_redirected_to question_localized_path(assigns(:question_localized))
  end

  def test_should_show_question_localized
    get :show, :id => question_localizeds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => question_localizeds(:one).id
    assert_response :success
  end

  def test_should_update_question_localized
    put :update, :id => question_localizeds(:one).id, :question_localized => { }
    assert_redirected_to question_localized_path(assigns(:question_localized))
  end

  def test_should_destroy_question_localized
    assert_difference('QuestionLocalized.count', -1) do
      delete :destroy, :id => question_localizeds(:one).id
    end

    assert_redirected_to question_localizeds_path
  end
end
