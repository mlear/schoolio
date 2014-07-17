class UsersController < ApplicationController
  def index
    if session[:remember_token] != nil
      @user = current_user
      redirect_to @user
    else
      render 'index'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      sign_in @user
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def show
    if params[:id]
      @user = User.find params[:id]
    else
      @user = current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
