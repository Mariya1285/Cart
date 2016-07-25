class SelectedProductsController < ApplicationController


	def new
		@selected_product = SelectedProduct.new
	end

	def create
		@selected_product = SelectedProduct.new(selected_product_params)
 
	  if @selected_product.save
	    redirect_to @selected_product
	  else
	    render 'new'
	  end
	end


	private
  def selected_product_params
    params.require(:selected_product).permit(:name)
  end
end
