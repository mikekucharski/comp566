class StaticPagesController < ApplicationController
	layout 'login', :only => [:welcome, :contact, :about]
	skip_before_action :logged_in_user

	def welcome
	end

	def contact
	end

	def about
	end

end
