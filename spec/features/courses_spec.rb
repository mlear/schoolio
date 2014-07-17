require 'rails_helper'

describe 'Course Features' do

let(:course) { Course.create(name: 'Calculus', subject: 'Math') }
let(:courses) { Course.all }

  #----------------- INDEX AND SHOW --------------------------

  context 'index page should have all the courses listed' do

    it 'should display course links to the show pages' do
      course
      visit courses_url
      click_link(course.name)
      expect(current_path).to eq(course_path(course))
    end
    it 'should have a button that links to the new course page' do
      visit courses_url
      click_link('Create a new Course')
      expect(current_path).to eq(new_course_path)
    end
  end

  context 'should display course name and subject and be able to edit/delete' do

    it 'should display course name' do
      course
      visit course_url(course)
      expect(page).to have_content(course.name)
    end
    it 'should display course subject' do
      course
      visit course_url(course)
      expect(page).to have_content(course.subject)
    end
    it 'should have a link to edit the course' do
      visit course_url(course)
      click_link('Edit')
      expect(current_path).to eq(edit_course_path(course))
    end
    it 'should have a button to delete the course' do
      visit course_url(course)
      expect{ click_on('delete') }.to change{Course.count}.by(-1)
    end
  end

  #----------------- CREATING AND SAVING ---------------------

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
  		fill_in('Subject', :with => "Math")
  		fill_in('Name', :with => "Multivariate Calculus")

  		expect{ click_on('Add course') }.to change{Course.count}.by(1) 

  	end

  	it 'should redirect to the new courses show' do 
  		visit new_course_url
  		fill_in('Subject', :with => "Math")
  		fill_in('Name', :with => "Multivariate Calculus")
  		click_on('Add course')

  		expect(course_url(Course.last)).to end_with(current_path)

  	end
  end

  context 'going to the course edit page' do

  	# let(:course) {Course.create(name: 'Calculus', subject: 'Math')}

  	it 'sees a form submit button' do
      visit edit_course_url(course)
      expect(page).to have_button('Update course')
    end

    it 'sees a field to edit subject' do
      visit edit_course_url(course)
      expect(page).to have_field('course_subject')
    end

    it 'sees a field to edit name' do
      visit edit_course_url(course)
      expect(page).to have_field('course_name')
    end
  end

  context 'editing a course' do

  	let(:course) {Course.create(name: 'Calculus', subject: 'Math')}

  	# it 'should change the updated at field in the database' do 
  	# 	visit edit_course_url(course)
  	# 	fill_in('Subject', :with => "History")  
  	# 	# fill_in('course_name', :with => "")
  	# 	fill_in('Name', :with => "Algebra 1")
  	# 	save_and_open_page
  	# 	expect{ click_on('Update course') }.to change{course.name} 

  	# end

  	it 'should redirect to the new courses show' do 
  		visit edit_course_url(course)
  		fill_in('course_subject', :with => "Math")
  		fill_in('course_name', :with => "Multivariate Calculus")
  		click_on('Update course')

  		expect(course_url(Course.last)).to end_with(current_path)

  	end
  end
end