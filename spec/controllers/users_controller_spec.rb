require 'rails_helper'

describe UsersController do
  let(:new_valid_user) { attributes_for :valid_user }
  let(:new_invalid_user) { attributes_for :invalid_user }

  describe '#create' do

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

  describe '#show' do
    let(:user) { create :valid_user }

    it 'passes the current user to the view' do
      sign_in(user)
      get :show, id: user.id
      expect(assigns :user).to be_a User
      expect(assigns(:user).first_name).to eq user.first_name
    end
  end

  describe '#edit' do
    let(:user) { create :valid_user }

    it 'passes the current user to the edit view' do
      sign_in(user)
      get :edit, id: user.id
      expect(assigns :user).to be_a User
      expect(assigns(:user).first_name).to eq user.first_name
    end
  end

  describe '#update' do
    let(:user) { create :valid_user }
    let(:user_params) { attributes_for :unsaved_user }


    context 'with valid authorization' do
      let(:update) { { id: user.id, user: user_params } }

      it 'updates user information' do
        sign_in user
        post :update, update
        expect(assigns(:user).first_name).to eq 'Leslie'
        expect(response.redirect?).to be true
      end
    end
  end

  describe '#non-update' do
    let(:user) { create :valid_user }
    let(:user_params) { attributes_for :unsaved_user }


    context 'with invalid authorization' do
      let(:update) { { id: user.id, user: user_params } }

      it 'does not update user information' do
        post :update, update
        expect(assigns(:user).first_name).not_to eq 'Leslie'
        expect(response.redirect?).to be true
      end
    end

  end

  describe '#destroy' do
    let(:user) { create :valid_user }

    it 'deletes the user from the database' do
      sign_in user
      post :destroy, id: user.id
      expect(User.last).to be(nil)
      expect(response.redirect?).to be true
    end
  end

  def sign_in(user)
    session[:remember_token] = user.id
  end
end
