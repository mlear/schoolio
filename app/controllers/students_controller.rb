require 'cgi'

class StudentsController < UsersController

	def index
    if session[:remember_token] != nil
      @user = current_student
      redirect_to @user
    else
      render 'index'
    end
  end

  def create
    @user = Student.new(user_params)

    if @user.valid?
      @user.save
      sign_in @user
      redirect_to student_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    assign_user
    redirect_to root_path unless signed_in?(@user)
  end

  def edit
    assign_user
    render 'edit'
  end

  def update
    @user = Student.find(params[:id])
    if signed_in?(@user)
      @user.update(user_params)
      redirect_to student_path(@user)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @user = current_student
    Student.destroy(@user.id)
    sign_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end


end
