require 'test_helper'

class AtrainingsControllerTest < ActionController::TestCase
  setup do
    @atraining = atrainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atrainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atraining" do
    assert_difference('Atraining.count') do
      post :create, atraining: { comment: @atraining.comment }
    end

    assert_redirected_to atraining_path(assigns(:atraining))
  end

  test "should show atraining" do
    get :show, id: @atraining
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atraining
    assert_response :success
  end

  test "should update atraining" do
    patch :update, id: @atraining, atraining: { comment: @atraining.comment }
    assert_redirected_to atraining_path(assigns(:atraining))
  end

  test "should destroy atraining" do
    assert_difference('Atraining.count', -1) do
      delete :destroy, id: @atraining
    end

    assert_redirected_to atrainings_path
  end
end
