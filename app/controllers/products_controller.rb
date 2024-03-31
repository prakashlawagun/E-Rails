class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only:[:create, :update,:destroy, :edit, :new]

  def index
    @product = Product.all
    render "/index"
  end

  def show
    @product = Product.find(params[:id])
    render 'product_view_data'
  end

  def new
    @product = Product.new
    render 'product_create_form'
  end

  def create
    @product = Product.new(product_params)

    if @product.save
        redirect_to "/products", notice: "Product was successfully created."
      else
        redirect_to '/products/register'
    end
  end

  def edit
    @product = Product.find(params[:id])
    render 'product_edit_form'
  end

  def update
    if @product.update(product_params)
      redirect_to '/products', notice: "Product was successfully updated."
    else
      render 'product_edit_form'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end
