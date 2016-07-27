class ProductsController < ApplicationController


  def products_sync

  end 
  
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

	def create
    @product = Product.new(product_params)

    params[:product][:categories].delete_at(0)
    
    @product.categories << Category.find(params[:product][:categories].map(&:to_i))

    if @product.save
      redirect_to @product
    else
      render 'new'
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
