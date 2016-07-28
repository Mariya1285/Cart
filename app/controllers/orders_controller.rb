class OrdersController < ApplicationController


	def index
		@order = Order.all

	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new
 		@order.user_id = current_user.id

 		if @order.save
	    
	    SelectedProduct.all.each do |product|

	 			if product.user_id == current_user.id

	 				@order_item = @order.order_items.create({ :product_id => product.product_id, :price => product.price, :quantity => product.quantity })
	 				
	 				product.delete

	 			end

 			end

 			

	    #redirecting to list of order items
	  	#redirect_to order_order_items_path(@order.id) 
	  	redirect_to orders_path(@order.id)	
 		
 		else
	    render 'new'
		end
 		
	end
end
