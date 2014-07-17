require 'rails_helper'

describe Course do
	let(:course) {Course.create(subject: 'Physics', name: 'Science')}
	
	describe 'check attributes for courses' do

		it 'should check to see if the subject is there' do
			expect(course).to respond_to(:subject)
		end

		it 'should check to see if the name is there' do
			expect(course).to respond_to(:name)
		end
	end

	describe 'associations should be' do
		it 'should have many grades' do 
			expect(course).to have_many(:grades)
		end
		it 'should have many users through grades' do 
			expect(course).to have_many(:users)
		end
	end
end