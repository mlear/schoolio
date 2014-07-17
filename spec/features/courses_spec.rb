require 'rails_helper'

describe 'Course pages' do

  context 'going to the new course page' do

  	it 'sees a form submit button' do
      visit new_course_url
      expect(page).to have_button('Add course')
    end

    it 'sees a field to enter subject' do
      visit new_course_url
      expect(page).to have_field('course_subject')
    end

    it 'sees a field to enter name' do
      visit new_course_url
      expect(page).to have_field('course_name')
    end
  end

  context 'creating and saving a new course' do
  	it 'should increase courses in the database by 1' do 
  		visit new_course_url
  		fill_in('course_subject', :with => "Math")
  		fill_in('course_name', :with => "Multivariate Calculus")

  		expect{ click_on('Add course') }.to change{Course.count}.by(1) 

  	end

  	it 'should redirect to the new courses show' do 
  		visit new_course_url
  		fill_in('course_subject', :with => "Math")
  		fill_in('course_name', :with => "Multivariate Calculus")
  		click_on('Add course')

  		expect(course_url(Course.last)).to end_with(current_path)

  	end
  end
end