require 'test_helper'

class GathletesControllerTest < ActionController::TestCase
  setup do
    @gathlete = gathletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gathletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gathlete" do
    assert_difference('Gathlete.count') do
      post :create, gathlete: {  }
    end

    assert_redirected_to gathlete_path(assigns(:gathlete))
  end

  test "should show gathlete" do
    get :show, id: @gathlete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gathlete
    assert_response :success
  end

  test "should update gathlete" do
    patch :update, id: @gathlete, gathlete: {  }
    assert_redirected_to gathlete_path(assigns(:gathlete))
  end

  test "should destroy gathlete" do
    assert_difference('Gathlete.count', -1) do
      delete :destroy, id: @gathlete
    end

    assert_redirected_to gathletes_path
  end
end
