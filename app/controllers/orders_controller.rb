class OrdersController < ApplicationController

	def index
		@orders = current_user.orders.order(created_at: :desc)
	end

	def create
		@cart = params[:cart]
		order = current_user.orders.create()
		cost = 0.0
		@cart.each do | pid, q |
			productID = Integer(pid)
			quantity = Integer(q)

			product = Product.find(productID);
			product.update_attribute(:stock, (product.stock - quantity))
			cost += (product.price * quantity)
			order.order_products.create({product: product, quantity: quantity})
		end

		current_user.update_attribute(:balance, current_user.balance - cost)

	  respond_to do |format|
    	flash.now[:success] = 'Your Order has been processed!' # Not quite right!
			# # format.html { redirect_to @user, notice: 'User was successfully created.' }
			# # format.html
			# format.js
			# format.json render {success: true}
			format.json { render json: {success: true} } 
			#format.json { render json: {nothing: true, success: true} }
   end
   
	end

	def show
		order = Order.find(params[:id])
		@products = order.order_products.joins(:product)
		@total = 0.0
		@products.each do |op|
			@total += (op.product.price * op.quantity)
		end
	end

	def checkout
		
	end
end
