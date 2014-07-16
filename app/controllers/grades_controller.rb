class GradesController < ApplicationController
  
  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.create(grade_params)
    # @grade = Grade.create(user_id: 1, course_id: 1, gpa: 3.5)
  end

  def show
    set_grade
  end

  def edit
    set_grade
  end

  def update
    set_grade
    @grade.update_attributes(grade_params)
    redirect_to @grades
  end

  def destroy
    set_grade
    @grade.destroy 

    redirect_to @grades
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

  private

    def grade_params
      params.require(:grade).permit(:user_id, :course_id, :gpa)
    end
  
end
