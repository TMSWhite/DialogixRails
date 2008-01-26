require File.dirname(__FILE__) + '/../test_helper'

class EntryAnswersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_answers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_entry_answer
    assert_difference('EntryAnswer.count') do
      post :create, :entry_answer => { }
    end

    assert_redirected_to entry_answer_path(assigns(:entry_answer))
  end

  def test_should_show_entry_answer
    get :show, :id => entry_answers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => entry_answers(:one).id
    assert_response :success
  end

  def test_should_update_entry_answer
    put :update, :id => entry_answers(:one).id, :entry_answer => { }
    assert_redirected_to entry_answer_path(assigns(:entry_answer))
  end

  def test_should_destroy_entry_answer
    assert_difference('EntryAnswer.count', -1) do
      delete :destroy, :id => entry_answers(:one).id
    end

    assert_redirected_to entry_answers_path
  end
end
