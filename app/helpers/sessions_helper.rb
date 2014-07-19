module SessionsHelper
  attr_reader :current_user

  def sign_in(user)
    session[:remember_token] = user.id
  end

  def sign_out
    session[:remember_token] = nil
  end

  # def current_user
  #   @current_user
  # end

  def current_student
    @current_user = Student.find(session[:remember_token])
  end

  def current_instructor
    @current_user = Instructor.find(session[:remember_token])
  end

  def signed_in?(user)
    return false unless session[:remember_token]
    user != nil
  end
end
