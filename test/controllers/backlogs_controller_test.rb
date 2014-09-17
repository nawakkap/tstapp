require 'test_helper'

class BacklogsControllerTest < ActionController::TestCase
  setup do
    @backlog = backlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backlog" do
    assert_difference('Backlog.count') do
      post :create, backlog: { backlog: @backlog.backlog, custname: @backlog.custname, orderAmt: @backlog.orderAmt, orderDate: @backlog.orderDate, productCode: @backlog.productCode, product_id: @backlog.product_id, sono: @backlog.sono }
    end

    assert_redirected_to backlog_path(assigns(:backlog))
  end

  test "should show backlog" do
    get :show, id: @backlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backlog
    assert_response :success
  end

  test "should update backlog" do
    patch :update, id: @backlog, backlog: { backlog: @backlog.backlog, custname: @backlog.custname, orderAmt: @backlog.orderAmt, orderDate: @backlog.orderDate, productCode: @backlog.productCode, product_id: @backlog.product_id, sono: @backlog.sono }
    assert_redirected_to backlog_path(assigns(:backlog))
  end

  test "should destroy backlog" do
    assert_difference('Backlog.count', -1) do
      delete :destroy, id: @backlog
    end

    assert_redirected_to backlogs_path
  end
end
