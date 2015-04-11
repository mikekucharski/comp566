class UsersController < ApplicationController
	layout 'login', :only => [:new, :create]
	skip_before_action :logged_in_user, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
		@user = User.new(user_params)
		if @user.save
			# Handle a successful save.
			flash[:success] = "Welcome to Eastern Shredder!"
			log_in @user
			redirect_to home_url
		else
			render 'new'
		end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to login_url
	end

  def home
    @brands = Brand.all
  end

  def addBalance
    current_user.update_attribute(:balance, current_user.balance + 200.00)
    flash[:success] = "$200 has been added to your account!"
    redirect_to home_path
  end

	private 
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password,
																	 :password_confirmation)
		end

    # Before filters
   	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
   	end
end
