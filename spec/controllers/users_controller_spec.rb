require 'rails_helper'

describe UsersController do

  describe '#create' do
    let(:valid) do
      { user: {
        first_name: "Ron",
        last_name: "Swanson",
        email: 'noneofyer@damn.biz',
        password: 'foobar',
        password_confirmation: 'foobar' } }
    end

    describe 'with valid information' do
      it 'creates a new User' do
        get :create, valid
        expect(assigns(:user)).to be_a User
        expect(assigns(:user)).to be_valid
      end
    end

    describe 'with invalid info' do
      it 'invalidates a duplicate user' do
        get :create, valid
        get :create, valid
        expect(assigns(:user)).not_to be_valid
      end

      it 'redirects to root_path' do
        get :create, valid
        get :create, valid
        expect(response.redirect?).to be true
      end

    end
  end

end
