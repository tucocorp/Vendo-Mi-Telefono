require 'test_helper'

class BuyDetailsControllerTest < ActionController::TestCase
  setup do
    @buy_detail = buy_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buy_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buy_detail" do
    assert_difference('BuyDetail.count') do
      post :create, buy_detail: { buy_id: @buy_detail.buy_id, imei: @buy_detail.imei, model_id: @buy_detail.model_id, price: @buy_detail.price, state_id: @buy_detail.state_id }
    end

    assert_redirected_to buy_detail_path(assigns(:buy_detail))
  end

  test "should show buy_detail" do
    get :show, id: @buy_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buy_detail
    assert_response :success
  end

  test "should update buy_detail" do
    patch :update, id: @buy_detail, buy_detail: { buy_id: @buy_detail.buy_id, imei: @buy_detail.imei, model_id: @buy_detail.model_id, price: @buy_detail.price, state_id: @buy_detail.state_id }
    assert_redirected_to buy_detail_path(assigns(:buy_detail))
  end

  test "should destroy buy_detail" do
    assert_difference('BuyDetail.count', -1) do
      delete :destroy, id: @buy_detail
    end

    assert_redirected_to buy_details_path
  end
end
