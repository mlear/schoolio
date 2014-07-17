require 'rails_helper'

describe 'Grades' do
  before do
    Course.create(name: 'Science', subject: 'Physics')
  end

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
      expect(page).to have_field('grade_course')
    end
  end

  context 'creating and saving a new grade' do
    it 'should increase grades in the database by 1' do
      visit new_grade_url

      fill_in('grade_gpa', :with => 3.0)
      select("Science", :from => "grade_course")

      expect{ click_on('Add grade') }.to change{Grade.count}.by(1)

    end

      it 'should redirect to the new grades show' do
        visit new_grade_url
        fill_in('grade_gpa', :with => 3.0)
        select("Science", :from => "grade_course")

        click_on('Add grade')

        expect(grade_url(Grade.last)).to end_with(current_path)

    end
  end
end
