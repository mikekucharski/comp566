class StaticPagesController < ApplicationController
	layout 'login', :only => [:welcome, :signin, :register, :contact, :about]

	def welcome
	end
	
	def signin
		@user = User.new
	end

	def register
		@user = User.new
	end

	def home
	end

	def products
	end

	def about
	end

end
