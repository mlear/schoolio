class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to @user
    else
      @sign_up = true
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
