require 'test_helper'

class EggsControllerTest < ActionController::TestCase
  setup do
    @egg = eggs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eggs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egg" do
    assert_difference('Egg.count') do
      post :create, egg: { quantity: @egg.quantity }
    end

    assert_redirected_to egg_path(assigns(:egg))
  end

  test "should show egg" do
    get :show, id: @egg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @egg
    assert_response :success
  end

  test "should update egg" do
    put :update, id: @egg, egg: { quantity: @egg.quantity }
    assert_redirected_to egg_path(assigns(:egg))
  end

  test "should destroy egg" do
    assert_difference('Egg.count', -1) do
      delete :destroy, id: @egg
    end

    assert_redirected_to eggs_path
  end
end
