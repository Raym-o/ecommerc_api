require "application_system_test_case"

class CollectionProductsTest < ApplicationSystemTestCase
  setup do
    @collection_product = collection_products(:one)
  end

  test "visiting the index" do
    visit collection_products_url
    assert_selector "h1", text: "Collection Products"
  end

  test "creating a Collection product" do
    visit collection_products_url
    click_on "New Collection Product"

    fill_in "Collection", with: @collection_product.collection_id
    fill_in "Product", with: @collection_product.product_id
    click_on "Create Collection product"

    assert_text "Collection product was successfully created"
    click_on "Back"
  end

  test "updating a Collection product" do
    visit collection_products_url
    click_on "Edit", match: :first

    fill_in "Collection", with: @collection_product.collection_id
    fill_in "Product", with: @collection_product.product_id
    click_on "Update Collection product"

    assert_text "Collection product was successfully updated"
    click_on "Back"
  end

  test "destroying a Collection product" do
    visit collection_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collection product was successfully destroyed"
  end
end
