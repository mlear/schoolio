class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:remember_token] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end
end
