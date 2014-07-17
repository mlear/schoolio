require 'rails_helper'

describe UsersController do

  describe '#create' do
    let(:new_valid_user) { attributes_for :valid_user }
    let(:new_invalid_user) { attributes_for :invalid_user }

    describe 'with valid information' do
      let(:valid) { { user: new_valid_user} }
      it 'creates a new User' do
        get :create, valid
        expect(assigns(:user)).to be_a User
        expect(assigns(:user)).to be_valid
      end
    end

    describe 'with invalid info' do
      let(:valid) { { user: new_valid_user} }
      let(:invalid) { { user: new_invalid_user} }
      it 'invalidates a duplicate user' do
        get :create, valid
        get :create, valid
        expect(assigns(:user)).not_to be_valid
      end

      it 'invalidates a user with missing info' do
        get :create, invalid
        expect(assigns(:user)).not_to be_valid
      end

      it 'redirects to root_path' do
        get :create, valid
        get :create, valid
        expect(response.redirect?).to be true
        get :create, invalid
        expect(response.redirect?).to be true
      end

    end
  end

end