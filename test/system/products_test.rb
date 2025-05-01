require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
    @product = products(:one)
    @product.category = @category
    @product.save
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "All Products"
  end

  test "visiting the category products index" do
    visit category_products_url(@category)
    assert_selector "h1", text: "Products in #{@category.name}"
  end

  test "should create product" do
    visit category_products_url(@category)
    click_on "New product"

    fill_in "Name", with: "New Test Product"
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back to products"
  end

  test "should update Product" do
    visit category_product_url(@category, @product)
    click_on "Edit this product", match: :first

    fill_in "Name", with: "Updated Product Name"
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back to products"
  end

  test "should destroy Product" do
    visit category_product_url(@category, @product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
