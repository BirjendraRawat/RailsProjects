class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    # debugger
    @user = User.new
  end

  def create
<<<<<<< HEAD
    @user = User.new(user_params)   # Not the final implementation!
    if @user.save
      # Handle a successful save.
=======
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Sample App!"
      redirect_to @user
>>>>>>> sign-up
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
