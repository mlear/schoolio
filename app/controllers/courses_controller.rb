class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new 
		@course = Course.new
	end

	def create 
		@course = Course.create(course_params)
		redirect_to @course 
	end

	def show
		set_course
	end

	def edit
		set_course
	end

	def update
		set_course
		@course.update_attributes(course_params)
		redirect_to @course
	end

	def destroy
		set_course
		@course.destroy

		redirect_to @course
	end

	def set_course
		@course = Course.find(params[:id])
	end

	private

		def course_params
			params.require(:course).permit(:subject, :name)
		end
end
