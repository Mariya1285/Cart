class SelectedProductsController < ApplicationController

	helper_method :current_user

	def index
    @product = SelectedProduct.all
  end


	def new
		
		@selected_product = SelectedProduct.new
	
	end

	def create
		@user = current_user
		@p = Product.find(params[:format])
		@selected_product = SelectedProduct.new
		#@product = params[:product]
		
		@selected_product.product_id = @p.id
		@selected_product.price = @p.price
		@selected_product.user_id = current_user.id
		@selected_product.quantity = 1
		
 		
	  if @selected_product.save
	  render  'index'
	  else
	    render 'new'
	  end
	end

	def edit

	end

	def update
		@selected_product = SelectedProduct.find(params[:id])
	 
	  if @selected_product.update(params.require(:selected_product).permit(:quantity))
	    render 'index'
	  else
	    render 'edit'
	  end
	end 

	def destroy
	  
	  @selected_product = SelectedProduct.find(params[:id])
	  
	  @selected_product.destroy
	 
		render  'index'
	end
		
	private
  def selected_product_params
    params.require(:p).permit(:quantity)
  end
end
