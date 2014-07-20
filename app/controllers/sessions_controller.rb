class SessionsController < ApplicationController

  def create
    check_for_unique_email
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to @user
    else
      redirect_to root_path
    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def check_for_unique_email
    email = params[:session][:email].downcase
    @user = Student.find_by(email: email)
    unless @user
      @user = Instructor.find_by(email: email)
    end
    redirect_to root_path unless @user
  end
end
