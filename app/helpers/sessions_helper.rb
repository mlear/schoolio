module SessionsHelper
  attr_accessor :current_user

  def sign_in(user)
    session[:user_type] = user.class.to_s.downcase
    session[:remember_token] = user.id
  end

  def sign_out
    session[:remember_token] = nil
  end

  def signed_in?(user)
    if user.class == Student
      return false unless session[:remember_token] == user.id
      Student.find user.id
    elsif user.class == Instructor
      return false unless session[:remember_token] == user.id
      Instructor.find user.id
    end
  end

  private

    def current_student
      @current_user = Student.find(session[:remember_token]) if session[:remember_token]
    end

    def current_instructor
      @current_user = Instructor.find(session[:remember_token]) if session[:remember_token]
    end

    def assign_user
      if session[:user_type]
        @user = self.send("current_#{session[:user_type]}".to_sym)
      else
        nil
      end
    end
    # def assign_instructor
    #   @user = current_instructor if session[:remember_token]
    # end

    # def assign_student
    #   @user = current_student if session[:remember_token]
    # end
end
