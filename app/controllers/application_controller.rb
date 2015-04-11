class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :setupLeftNavBar
  before_filter :logged_in_user

  # Before filters
	def setupLeftNavBar
		@cat_skateboards = Category.where shop_type: "Skateboards"
		@cat_clothing = Category.where shop_type: "Clothing"
	end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    	store_location  # for friendly forwarding
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
