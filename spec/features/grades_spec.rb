require 'rails_helper'

describe 'Grades' do
  before do
    Course.create(name: 'Science', subject: 'Physics')
  end

  let!(:grade) { Grade.create!(user_id: 1, course_id: course.id, gpa: 3.5) }
  let(:grades) { Grade.all }
  let(:course) { Course.create!(name: 'Math', subject: 'Algebra') }

  #----------------- INDEX AND SHOW --------------------------

  context 'index page should have all the grades listed' do

    it 'should display grade links to the show pages' do
      course
      grade
      visit grades_url
      click_link(grade.gpa)
      expect(current_path).to eq(grade_path(grade))
    end
    it 'should have a button that links to the new grade page' do
      course
      visit grades_url
      click_link('Create a new Grade')
      expect(current_path).to eq(new_grade_path)
    end
  end

  context 'should display grade gpa and course and be able to edit/delete' do

    it 'should show gpa and course name' do
      visit grade_url(grade)
      expect(page).to have_content(grade.gpa)
    end
    it 'should display course for grade' do
      visit grade_url(grade)
      expect(page).to have_content(grade.course.name)
    end
    it 'should have a link to edit the grade' do
      visit grade_url(grade)
      click_link('Edit')
      expect(current_path).to eq(edit_grade_path(grade))
    end
    it 'should have a button to delete the grade' do
      visit grade_url(grade)
      expect{ click_on('delete') }.to change{Grade.count}.by(-1)
    end
  end

  # --------------------------------------------

  context 'going to the new grade page' do

    it 'sees a form submit button' do
      visit new_grade_url
      expect(page).to have_button('Add grade')
    end

    it 'sees a field to enter grade' do
      visit new_grade_url
      expect(page).to have_field('grade_gpa')
    end

    it 'sees a dropdown to select course' do
      visit new_grade_url
      expect(page).to have_field('grade_course_id')
    end
  end

  context 'creating and saving a new grade' do

    it 'should increase grades in the database by 1' do
      visit new_grade_url

      fill_in('grade_gpa', :with => 3.0)
      select(course.name, :from => "grade_course_id")

      expect{ click_on('Add grade') }.to change{Grade.count}.by(1)

    end
    # NEED TO GET INTO PARAMS HASH FOR SELECTOR

      it 'should redirect to the new grades show' do
        course
        visit new_grade_url
        fill_in('grade_gpa', :with => 3.0)
        select(course.name, :from => "grade_course_id")

        click_on('Add grade')

        expect(grade_url(Grade.last)).to end_with(current_path)

    end
  end
end
