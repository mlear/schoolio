require 'rails_helper'

system 'clear'

describe 'User pages' do
  # let(:user) { create :valid_user }
  let(:student) { create :valid_student }
  let(:instructor) { create :valid_instructor }

  let(:invalid_user) { build :invalid_user }
  let(:new_student) { build :valid_student }

  let(:duplicate) { build :unsaved_user }

  let(:new_instructor) { build :valid_instructor }
  let(:course) { create :course }

  context 'on the homepage' do
    before { visit root_path }
    subject { page }

    it { should have_content 'log in'}
    it { should have_content 'sign up'}

    describe 'when a user signs up' do
      before { click_on 'sign up' }
      context 'with valid information' do
        it 'should redirect to student profile' do
          fill_in "First name",             with: new_student.first_name
          fill_in "Last name",              with: new_student.last_name
          fill_in "Email",                  with: new_student.email
          fill_in "Password",               with: new_student.password
          fill_in "Password confirmation",  with: new_student.password
          click_button "sign_up"
          click_on 'student'
          expect(current_path).to eq student_path Student.last
        end

        it 'should redirect to instructor profile' do
          fill_in "First name",             with: new_instructor.first_name
          fill_in "Last name",              with: new_instructor.last_name
          fill_in "Email",                  with: new_instructor.email
          fill_in "Password",               with: new_instructor.password
          fill_in "Password confirmation",  with: new_instructor.password
          click_button "sign_up"
          fill_in "Passcode",               with: 'ineedanewjob'
          click_on 'teacher'
          expect(current_path).to eq instructor_path Instructor.last
        end
      end

      context 'with invalid information' do
        it 'should redirect to root' do
          fill_in "First name",             with: duplicate.first_name
          fill_in "Last name",              with: duplicate.last_name
          fill_in "Email",                  with: student.email
          fill_in "Password",               with: duplicate.password
          fill_in "Password confirmation",  with: duplicate.password
          click_button "sign_up"
          click_on 'student'
          expect(current_path).to eq(root_path)
        end
      end
    end

    describe 'when a user logs in' do
      context 'with valid information' do
        it 'logs in a student and redirects to student profile' do
          sign_in student
          expect(current_path).to eq student_path student
        end

        it 'logs in a instructor and redirects to instructor profile' do
          sign_in instructor
          expect(current_path).to eq instructor_path instructor
        end
      end

      describe 'with invalid information' do
        it 'redirects to home page' do
          sign_in invalid_user
          expect(current_path).to eq(root_path)
        end
      end
    end

    describe 'when a user logs out' do

      it 'logs out user and redirects' do
        sign_in student
        click_button "log out"
        expect(current_path).to eq(root_path)
      end
    end
  end

  context 'on the student page' do

    before { student.courses << course; sign_in student }

    it 'greets the student by name' do
      expect(page).to have_content student.first_name
    end

    # it 'displays the list of the students courses' do
    #   expect(page).to have_content(student.courses.first.name)
    # end

    # it 'has links to the students courses' do
    #   click_on "Musicology 101"
    #   expect(current_path).to eq(course_path(course))
    # end

    it 'has a student settings button' do
      click_on "settings"
      expect(current_path).to eq(edit_student_path(student))
    end
  end

  context 'on the edit page' do
    before { sign_in(student); visit edit_student_path(student) }

    it 'has a form field' do
      expect(page).to have_content(student.first_name)
    end

    it 'can update a student' do
      fill_in 'password',       with: student.password
      click_on "update"
      expect(current_path).to eq(student_path(student))
    end

    context 'on the instructor page' do

    before { sign_out; instructor.courses << course; sign_in instructor }

    it 'greets the instructor by name' do
      expect(page).to have_content instructor.first_name
    end

    it 'displays the list of the instructors courses' do
      expect(page).to have_content(instructor.courses.first.name)
    end

    it 'has links to the instructors courses' do
      click_on "Musicology 101"
      expect(current_path).to eq(course_path(course))
    end

    it 'has a instructor settings button' do
      click_on "settings"
      expect(current_path).to eq(edit_instructor_path(instructor))
    end

    it 'allows instructors to create new courses' do
      fill_in 'course name', with: "Wat"
      fill_in 'Subject', with: "Wat"
      expect{click_on "new course"}.to change{Course.count}
    end

    it 'allows me to view my students' do
      instructor.students << student
      visit instructor_path(instructor)
      expect(page).to have_content(instructor.students.first.first_name)
    end

    xit 'allows me to see my students courses' do
      instructor.students << student
      visit instructor_path(instructor)
      click_on("Bob Joblaw")
      expect(current_path).to eq(edit_my_student_path(student))
    end

    xit 'allows me to edit my students courses' do
      instructor.students << student
      visit instructor_path(instructor)
      click_on("Bob Joblaw")
      expect{click_on(course.name)}.to change{student.courses.count}
    end

    xit 'allows me to edit my students grades' do
      instructor.students << student
      visit instructor_path(instructor)
      click_on("Bob Joblaw")
    end

    xit 'allows me to edit my courses'do

    end

  end


  context 'on the edit page' do
    before { sign_out; sign_in(instructor); visit edit_instructor_path(instructor) }

    it 'has a form field' do
      expect(page).to have_content(instructor.first_name)
    end

    it 'can update a instructor' do
      fill_in 'password',       with: instructor.password
      click_on "update"
      expect(current_path).to eq(instructor_path(instructor))
    end
  end
end

  def sign_in(user)
    visit root_path
    fill_in "email",     with: user.email
    fill_in "password",  with: user.password
    click_button "sign_in"
  end

  def sign_out
    click_on 'log out'
  end
end
