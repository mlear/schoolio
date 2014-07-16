require 'rails_helper'

describe Course do
	describe 'check attributes for courses' do
		let(:course) {Course.create(subject: 'Physics', name: 'Science')}

		it 'should check to see if the subject is there' do
			expect(course).to respond_to(:subject)
		end

		it 'should check to see if the name is there' do
			expect(course).to respond_to(:name)
		end
	end
end