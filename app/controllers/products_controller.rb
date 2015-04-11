class ProductsController < ApplicationController

	def category
		@title = params[:category]
		cat = Category.where(name: params[:category])
		@products = Product.joins(:category).where(category: cat)
		render "items"
	end

	def brand
		@title = params[:brand]
		brand = Brand.where(name: params[:brand])
		@products = Product.joins(:brand).where(brand: brand)
		render "items"
	end

	def restock
		Product.all.each do |product|
			product.update_attribute(:stock, 15)
		end
		flash[:success] = "The store has been restocked! Thanks for keeping an eye out for us!"
    redirect_to home_path
	end

end
