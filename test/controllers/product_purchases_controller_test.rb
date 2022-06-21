require "test_helper"

class ProductPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_purchase = product_purchases(:one)
  end

  test "should get index" do
    get product_purchases_url, as: :json
    assert_response :success
  end

  test "should create product_purchase" do
    assert_difference('ProductPurchase.count') do
      post product_purchases_url, params: { product_purchase: { cost: @product_purchase.cost, product: @product_purchase.product, purchase: @product_purchase.purchase } }, as: :json
    end

    assert_response 201
  end

  test "should show product_purchase" do
    get product_purchase_url(@product_purchase), as: :json
    assert_response :success
  end

  test "should update product_purchase" do
    patch product_purchase_url(@product_purchase), params: { product_purchase: { cost: @product_purchase.cost, product: @product_purchase.product, purchase: @product_purchase.purchase } }, as: :json
    assert_response 200
  end

  test "should destroy product_purchase" do
    assert_difference('ProductPurchase.count', -1) do
      delete product_purchase_url(@product_purchase), as: :json
    end

    assert_response 204
  end
end
