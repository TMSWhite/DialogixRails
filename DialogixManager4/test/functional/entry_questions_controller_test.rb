require File.dirname(__FILE__) + '/../test_helper'

class EntryQuestionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_questions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_entry_question
    assert_difference('EntryQuestion.count') do
      post :create, :entry_question => { }
    end

    assert_redirected_to entry_question_path(assigns(:entry_question))
  end

  def test_should_show_entry_question
    get :show, :id => entry_questions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => entry_questions(:one).id
    assert_response :success
  end

  def test_should_update_entry_question
    put :update, :id => entry_questions(:one).id, :entry_question => { }
    assert_redirected_to entry_question_path(assigns(:entry_question))
  end

  def test_should_destroy_entry_question
    assert_difference('EntryQuestion.count', -1) do
      delete :destroy, :id => entry_questions(:one).id
    end

    assert_redirected_to entry_questions_path
  end
end
