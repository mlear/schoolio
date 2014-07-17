require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  describe '#create' do

    let(:valid) { { session: { email: 'noneofyour@damn.biz', password: 'foobar'} } }
    let(:invalid) { { session: { email: 'allofyour@damn.biz', password: 'foobar'} } }

    describe 'with valid information' do
      it 'should sign in a user' do
        User.create(first_name: "Ron", last_name: "Swanson", email: "noneofyour@damn.biz", password: "foobar")
        get :create, valid
        expect(session[:remember_token]).to_not be_blank
      end

      it 'should redirect user to profile' do
        User.create(first_name: "Ron", last_name: "Swanson", email: "noneofyour@damn.biz", password: "foobar")
        get :create, valid
        expect(response.redirect_url).to include user_path(assigns :user)
      end
    end

    describe 'with invalid information' do
      it 'does not sign in a user' do
        User.create(first_name: "Ron", last_name: "Swanson", email: "noneofyour@damn.biz", password: "foobar")
        get :create, invalid
        expect(session[:remember_token]).to be_blank
      end

      it 'redirects user to root' do
        User.create(first_name: "Ron", last_name: "Swanson", email: "noneofyour@damn.biz", password: "foobar")
        get :create, invalid
        expect(response.redirect_url).to include(root_path)
      end
    end
  end
end
