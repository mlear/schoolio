require 'rails_helper'

describe Grade do
	describe 'check attributes for grades' do
		let(:grade) {Grade.create(user_id: 1, course_id: 1, gpa: 3.7)}

		it 'should check to see if the user_id is there' do
			expect(grade).to respond_to(:user_id)
		end

		it 'should check to see if the course_id is there' do
			expect(grade).to respond_to(:course_id)
		end

		it 'should check to see if the gpa is there' do
			expect(grade).to respond_to(:gpa)
		end
	end
end

