require 'test_helper'

class ColsControllerTest < ActionController::TestCase
  setup do
    @col = cols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create col" do
    assert_difference('Col.count') do
      post :create, col: @col.attributes
    end

    assert_redirected_to col_path(assigns(:col))
  end

  test "should show col" do
    get :show, id: @col
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @col
    assert_response :success
  end

  test "should update col" do
    put :update, id: @col, col: @col.attributes
    assert_redirected_to col_path(assigns(:col))
  end

  test "should destroy col" do
    assert_difference('Col.count', -1) do
      delete :destroy, id: @col
    end

    assert_redirected_to cols_path
  end
end
