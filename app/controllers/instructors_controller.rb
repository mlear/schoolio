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
    @user = Instructor.new(user_params)
    if @user.valid?
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

  private

  def assign_user
    if params[:id]
      @user = Instructor.find params[:id]
    else
      @user = current_instructor
    end
  end

  def user_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end