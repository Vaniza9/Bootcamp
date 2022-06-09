class ProductsController < ApplicationController



  before_action :authenticate_user!



  def index


    @products = current_user.products

  end


  def show
    @product = Product.find(params[:id])
  end



  def new
    @product = Product.new
  end


  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id


    if @product.save


      redirect_to products_path
    else

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end



  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, status: :see_other
  end




  private
  def product_params
    params.require(:product).permit(:product_name, :quantity,:price)
  end



end
