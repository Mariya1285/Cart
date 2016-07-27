class OrderItemsController < ApplicationController

	def index
		
		@order_item = OrderItem.all

		
	end

	def create
		
	end

end
