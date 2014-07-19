require 'rails_helper'

system 'clear'

describe 'User pages' do
  let(:user) { create :valid_user }
  let(:student) { create :valid_student }
  let(:instructor) { create :valid_instructor }

  let(:invalid_user) { build :invalid_user }
  let(:new_user) { build :unsaved_user }
  let(:course) { create :course }

  context 'on the homepage' do
    before { visit root_path }
    subject { page }

    it { should have_content 'log in'}
    it { should have_content 'sign up'}

    describe 'when a user signs up' do
      before { click_on 'sign up' }
      context 'with valid information' do
        it 'should redirect to user profile' do
          fill_in "First name",             with: new_user.first_name
          fill_in "Last name",              with: new_user.last_name
          fill_in "Email",                  with: new_user.email
          fill_in "Password",               with: new_user.password
          fill_in "Password confirmation",  with: new_user.password
          click_button "sign_up"
          expect(current_path).to eq user_path User.last
        end
      end

      context 'with invalid information' do
        it 'should redirect to root' do
          fill_in "First name",             with: new_user.first_name
          fill_in "Last name",              with: new_user.last_name
          fill_in "Email",                  with: user.email
          fill_in "Password",               with: new_user.password
          fill_in "Password confirmation",  with: new_user.password
          click_button "sign_up"
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
        sign_in user
        click_button "log out"
        expect(current_path).to eq(root_path)
      end
    end
  end

  context 'on the user page' do

    before { user.courses << course; sign_in user }

    it 'greets the user by name' do
      expect(page).to have_content user.first_name
    end

    it 'displays the list of the users courses' do
      expect(page).to have_content(user.courses.first.name)
    end

    it 'has links to the users courses' do
      click_on "Musicology 101"
      expect(current_path).to eq(course_path(course))
    end

    it 'has a user settings button' do
      click_on "settings"
      expect(current_path).to eq(edit_user_path(user))
    end

    it 'has a delete user button' do
      click_on "Delete User"
      expect(current_path).to eq(root_path)
    end
  end


  context 'on the edit page' do
    before { sign_in(user); visit edit_user_path(user) }

    it 'has a form field' do
      expect(page).to have_content(user.first_name)
    end

    it 'can update a user' do
      fill_in 'password',       with: user.password
      click_on "update"
      expect(current_path).to eq(user_path(user))
    end
  end

  def sign_in(user)
    visit root_path
    fill_in "email",     with: user.email
    fill_in "password",  with: user.password
    click_button "sign_in"
  end
end
