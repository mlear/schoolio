require 'rails_helper'

describe UsersController do

  describe '#create' do
    let(:params) do
      { user: {
        first_name: "Ron",
        last_name: "Swanson",
        email: 'noneofyer@damn.biz',
        password: 'foobar',
        password_confirmation: 'foobar' } }
    end

    it 'creates a new User' do
      get :create, params
      expect(assigns(:user)).to be_a User
    end
  end

end
