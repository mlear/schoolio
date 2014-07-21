class GradesController < ApplicationController

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.create(grade_params)
    redirect_to :back
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

  def chart
    assign_user

    grades = @user.grades.group_by do |grade|
      grade.course.name if grade.course
    end

    new_grades = grades.select do |key, value|
      value.map! do |grade|
        grade.gpa
      end
    end

    render json: new_grades

  end

  # def instructor_chart
  #   assign_user
  #   course_averages = []


  #   @user.courses.each do |course|
  #     grades = []
  #     course.grades.each do |grade|
  #       grades << grade.gpa
  #     end
  #     course_averages << grades.inject(:+) / grades.length
  #     puts course_averages
  #   end


  #   render json: new_grades

  # end

  def set_grade
    @grade = Grade.find(params[:id])
  end


  private

    def grade_params
      params.require(:grade).permit(:student_id, :course_id, :gpa)
    end

end
