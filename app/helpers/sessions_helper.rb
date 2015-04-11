module SessionsHelper
	def log_in(user)
		# automatically encrypted! no session hijacking
		session[:user_id] = user.id
	end

	# Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil  # not needed but is good pratice
  end

	def current_user
		if (user_id = session[:user_id])
  		@current_user ||= User.find_by(id: user_id)
  	end
	end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get? # only for get requests. A user could technically delete their cookie then submit a form
  end
end
