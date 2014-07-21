class InstructorsController < UsersController

	def index
    if session[:remember_token] != nil
      @user = current_instructor
      redirect_to @user
    else
      render 'index'
    end
  end

  def create
    @user = Instructor.new(user_params) if params[:instructor][:passcode] == 'ineedanewjob'
    if @user && @user.valid?
      @user.save
      sign_in @user
      redirect_to instructor_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    assign_user
  end

  def edit
    assign_user
    render 'edit'
  end

  def update
    @user = Instructor.find(params[:id])
    if signed_in?(@user)
      @user.update(user_params)
      redirect_to instructor_path(@user)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @user = current_instructor
    Instructor.destroy(@user.id)
    sign_out
    redirect_to root_path
  end

  def editmystudent
    @student = Student.find(params[:id])
    @user = current_instructor
    @courses = Course.all
    render "editmystudent"
  end

  def addstudentcourse
    @user = Student.find(params[:id])
    Grade.create(course_params)
    render "editmystudent"
  end

  def add_instructor_course
    @user = current_instructor
    # course_id = params[:grade][:course_id]
    Course.update(params[:id], instructor_id: @user.id)
    redirect_to @user
  end

  private

  def user_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end

  def course_params
    params.require(:grade).permit(:student_id, :course_id)
  end
end
