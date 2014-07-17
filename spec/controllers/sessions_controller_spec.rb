require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  let(:user) { create :valid_user }
  let(:valid) { { session: { email: user.email, password: user.password } } }
  let(:invalid) { { session: { email: user.email, password: 'swag' } } }

  describe '#create' do

    describe 'with valid information' do
      it 'should sign in a user' do
        get :create, valid
        expect(session[:remember_token]).to_not be_blank
      end

      it 'should redirect user to profile' do
        get :create, valid
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
