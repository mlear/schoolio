require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  let(:user) { create :valid_user }
  let(:student) {create :valid_student}
  let(:instructor) {create :valid_instructor}
  let(:valid_student) { { session: { email: student.email, password: student.password } } }
  let(:valid_instructor) { { session: { email: instructor.email, password: instructor.password } } }
  let(:valid) { { session: { email: user.email, password: user.password } } }
  let(:invalid) { { session: { email: user.email, password: 'swag' } } }

  describe '#create' do

    describe 'with valid information' do
      it 'should sign in a student' do
        puts valid_student
        get :create, valid_student
        expect(session[:remember_token]).to_not be_blank
      end

      it 'should sign in a instructor' do
        get :create, valid_instructor
        expect(session[:remember_token]).to_not be_blank
      end

      it 'should redirect student to profile' do
        get :create, valid_student
        expect(response.redirect_url).to include user_path(assigns :user)
      end

      it 'should redirect instructor to profile' do
        get :create, valid_instructor
        expect(response.redirect_url).to include user_path(assigns :user)
      end
    end

    describe 'with invalid information' do
      it 'does not sign in a user' do
        get :create, invalid
        expect(session[:remember_token]).to be_blank
      end

      it 'redirects user to root' do
        get :create, invalid
        expect(response.redirect_url).to include(root_path)
      end
    end
  end

  describe '#destroy' do

    it 'should set session[:remember_token] to nil' do
      get :create, valid
      get :destroy
      expect(session[:remember_token]).to be_blank
    end
  end
end
