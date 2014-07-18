class SessionsController < ApplicationController

  def create
    email = params[:session][:email].downcase
    @user = ( student = Student.find_by_email(email) ? student : Instructor.find_by_email(email) )
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
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
