require 'test_helper'

class CollectionProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_product = collection_products(:one)
  end

  test "should get index" do
    get collection_products_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_product_url
    assert_response :success
  end

  test "should create collection_product" do
    assert_difference('CollectionProduct.count') do
      post collection_products_url, params: { collection_product: { collection_id: @collection_product.collection_id, product_id: @collection_product.product_id } }
    end

    assert_redirected_to collection_product_url(CollectionProduct.last)
  end

  test "should show collection_product" do
    get collection_product_url(@collection_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_product_url(@collection_product)
    assert_response :success
  end

  test "should update collection_product" do
    patch collection_product_url(@collection_product), params: { collection_product: { collection_id: @collection_product.collection_id, product_id: @collection_product.product_id } }
    assert_redirected_to collection_product_url(@collection_product)
  end

  test "should destroy collection_product" do
    assert_difference('CollectionProduct.count', -1) do
      delete collection_product_url(@collection_product)
    end

    assert_redirected_to collection_products_url
  end
end
