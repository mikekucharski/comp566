class SessionsController < ApplicationController
	layout 'login', :only => [:new, :create]
  skip_before_action :logged_in_user, only: [:new, :create]
  
	def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page. Log in comes from the sessionshelper
      log_in user
      redirect_back_or home_path
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
