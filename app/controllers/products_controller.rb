class ProductsController < ApplicationController


  def index
    @product = Product.all
  end

  def new
    @product = Product.new

	def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      render 'new'
    end

  end
 
  def update
    @category = Category.find(params[:id])
   
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
  redirect_to products_path
  end
 
  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :img)
    end

end
