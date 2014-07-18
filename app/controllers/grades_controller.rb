class GradesController < ApplicationController
  
  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.create(grade_params)
    redirect_to @grade
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
    redirect_to @grade
  end

  def destroy
    set_grade
    @grade.destroy 

    redirect_to @grade
  end

  def chart_info
    new_grades = []
    @student_grades = Grade.where(user_id: current_user)

    @student_grades.each do |grade|
      new_grades << [grade.course.name, grade.gpa]
    end
    render json: new_grades

  end

  def set_grade
    @grade = Grade.find(params[:id])
  end


  private

    def grade_params
      params.require(:grade).permit(:user_id, :course_id, :gpa)
    end
  
end
