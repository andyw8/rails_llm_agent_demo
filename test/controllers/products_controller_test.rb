require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @product = products(:one)
    @product.category = @category
    @product.save
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get category products index" do
    get category_products_url(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_product_url(@category)
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post category_products_url(@category), params: { product: { name: "New Test Product" } }
    end

    assert_redirected_to category_product_url(@category, Product.last)
  end

  test "should show product" do
    get category_product_url(@category, @product)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_product_url(@category, @product)
    assert_response :success
  end

  test "should update product" do
    patch category_product_url(@category, @product), params: { product: { name: "Updated Product Name" } }
    assert_redirected_to category_product_url(@category, @product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete category_product_url(@category, @product)
    end

    assert_redirected_to category_products_url(@category)
  end
end
