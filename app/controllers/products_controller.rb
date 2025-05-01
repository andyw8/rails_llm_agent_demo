class ProductsController < ApplicationController
  before_action :set_category, except: [:index]
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /categories/:category_id/products
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end
  end

  # GET /categories/:category_id/products/1
  def show
  end

  # GET /categories/:category_id/products/new
  def new
    @product = @category.products.build
  end

  # GET /categories/:category_id/products/1/edit
  def edit
  end

  # POST /categories/:category_id/products
  def create
    @product = @category.products.build(product_params)

    if @product.save
      redirect_to category_product_path(@category, @product), notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/:category_id/products/1
  def update
    if @product.update(product_params)
      redirect_to category_product_path(@category, @product), notice: "Product was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:category_id/products/1
  def destroy
    @product.destroy!
    redirect_to category_products_path(@category), notice: "Product was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_product
      @product = @category.products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name)
    end
end
