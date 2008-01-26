require File.dirname(__FILE__) + '/../test_helper'

class EntryItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_entry_item
    assert_difference('EntryItem.count') do
      post :create, :entry_item => { }
    end

    assert_redirected_to entry_item_path(assigns(:entry_item))
  end

  def test_should_show_entry_item
    get :show, :id => entry_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => entry_items(:one).id
    assert_response :success
  end

  def test_should_update_entry_item
    put :update, :id => entry_items(:one).id, :entry_item => { }
    assert_redirected_to entry_item_path(assigns(:entry_item))
  end

  def test_should_destroy_entry_item
    assert_difference('EntryItem.count', -1) do
      delete :destroy, :id => entry_items(:one).id
    end

    assert_redirected_to entry_items_path
  end
end
