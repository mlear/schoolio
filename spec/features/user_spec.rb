require 'rails_helper'

system 'clear'

describe 'User pages' do
  let(:user) { create :valid_user }
  let(:new_user) { build :unsaved_user }

  context 'on the homepage' do
    before { visit root_path }
    subject { page }

    it { should have_content 'Log In'}
    it { should have_content 'Sign Up'}

    describe 'when a user signs up' do
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
        it 'logs in a user and redirects to user profile' do
          fill_in "Login email",     with: user.email
          fill_in "Login password",  with: user.password
          click_button "sign_in"
          expect(current_path).to eq user_path user
        end
      end

      describe 'with invalid information' do
        it 'redirects to home page' do
          fill_in "Login email",     with: user.email
          fill_in "Login password",  with: 'stupid-head'
          click_button "sign_in"
          expect(current_path).to eq(root_path)
        end
      end
    end
  end
end