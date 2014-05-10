require 'test_helper'

class InforamtionsControllerTest < ActionController::TestCase
  setup do
    @inforamtion = inforamtions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inforamtions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inforamtion" do
    assert_difference('Inforamtion.count') do
      post :create, inforamtion: {  }
    end

    assert_redirected_to inforamtion_path(assigns(:inforamtion))
  end

  test "should show inforamtion" do
    get :show, id: @inforamtion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inforamtion
    assert_response :success
  end

  test "should update inforamtion" do
    patch :update, id: @inforamtion, inforamtion: {  }
    assert_redirected_to inforamtion_path(assigns(:inforamtion))
  end

  test "should destroy inforamtion" do
    assert_difference('Inforamtion.count', -1) do
      delete :destroy, id: @inforamtion
    end

    assert_redirected_to inforamtions_path
  end
end
