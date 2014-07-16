require 'rails_helper'

system 'clear'

describe 'User pages' do
  let(:user) { User.last }
  context 'on the homepage' do

    before { visit root_path }
    subject { page }

    it { should have_content 'Log In'}
    it { should have_content 'Sign Up'}

    describe 'when a user signs up' do

      context 'with valid information' do
        let(:first_name)  { "Ron" }
        let(:last_name)  { "Swanson" }
        let(:new_email) { "new@example.com" }
        let(:password) { "foo" }

        it 'should redirect to user profile' do
          fill_in "First name",             with: first_name
          fill_in "Last name",              with: last_name
          fill_in "Email",                  with: new_email
          fill_in "Password",               with: password
          fill_in "Password confirmation",  with: password
          click_button "sign_up"
          expect(current_path).to eq(user_path(user))
        end
      end
      context 'with invalid information' do
        let(:first_name)  { "Ron" }
        let(:last_name)  { "Swanson" }
        let(:new_email) { "new@example.com" }
        let(:password) { "foo" }

        it 'should redirect to root' do
          User.create(first_name: "Ron", last_name: "Swanson", email: "new@example.com", password: "foo")
          fill_in "First name",             with: first_name
          fill_in "Last name",              with: last_name
          fill_in "Email",                  with: new_email
          fill_in "Password",               with: password
          fill_in "Password confirmation",  with: password
          click_button "sign_up"
          expect(current_path).to eq(root_path)
        end

      end
    end

    # describe 'when a user signs in' do
    #   context 'should display the user page' do
    #     User.create(first_name: "Ron", last_name: "Swanson", email: "new@example.com", password: "foo")
    #     fill_in "User Email",     with: "new@example.com"
    #     fill_in "Password",       with: "foo"
    #     click_button "login"
    #     expect(current_path).to eq(user_path(user))
    #   end
    # end

  end

end
