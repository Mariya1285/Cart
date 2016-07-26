class ProductsController < ApplicationController


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
    #categories = Array.new(params.require(:product).permit(:categories))
    #@product.categories||= Array.new
    if @product.save
      #@product.categories.create(params[:product][:categories])
      #categories.each do |c|
          #@product.categories << categories.create(params.require(:product).permit(:categories))
         #@product.categories.create(params.require(:product).permit(:categories))
      #end
     # @product.categories << params.require(:product).permit(:categories)
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
