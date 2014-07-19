class SessionsController < ApplicationController

  def create
    email = params[:session][:email].downcase
    @user = Student.find_by(email: email)
    if @user == nil
      @user = Instructor.find_by(email: email)
      if @user == nil
        redirect_to root_path
      else
        if @user && @user.authenticate(params[:session][:password])
          sign_in @user
          redirect_to @user
        else
          @sign_up = true
          redirect_to root_path
        end
      end
    else
      if @user && @user.authenticate(params[:session][:password])
        sign_in @user
        redirect_to @user
      else
        @sign_up = true
        redirect_to root_path
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
