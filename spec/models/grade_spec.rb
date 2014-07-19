require 'rails_helper'

describe Grade do
	let(:grade) {Grade.create(student_id: 1, course_id: 1, gpa: 3.7)}
	describe 'check attributes for grades' do

		it 'should check to see if the student_id is there' do
			expect(grade).to respond_to(:student_id)
		end

		it 'should check to see if the course_id is there' do
			expect(grade).to respond_to(:course_id)
		end

		it 'should check to see if the gpa is there' do
			expect(grade).to respond_to(:gpa)
		end
	end

	describe 'associations should be' do
		it 'should belong to a course' do
			expect(grade).to belong_to(:course)
		end
		it 'should belong to a student' do
			expect(grade).to belong_to(:student)
		end
	end
end

