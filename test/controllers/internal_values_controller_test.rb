require 'test_helper'

class InternalValuesControllerTest < ActionController::TestCase
  setup do
    @internal_value = internal_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_value" do
    assert_difference('InternalValue.count') do
      post :create, internal_value: { category: @internal_value.category, name: @internal_value.name, seq: @internal_value.seq, value: @internal_value.value }
    end

    assert_redirected_to internal_value_path(assigns(:internal_value))
  end

  test "should show internal_value" do
    get :show, id: @internal_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internal_value
    assert_response :success
  end

  test "should update internal_value" do
    patch :update, id: @internal_value, internal_value: { category: @internal_value.category, name: @internal_value.name, seq: @internal_value.seq, value: @internal_value.value }
    assert_redirected_to internal_value_path(assigns(:internal_value))
  end

  test "should destroy internal_value" do
    assert_difference('InternalValue.count', -1) do
      delete :destroy, id: @internal_value
    end

    assert_redirected_to internal_values_path
  end
end
