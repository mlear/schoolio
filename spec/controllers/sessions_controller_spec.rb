require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  describe '#create' do

    let(:valid) { { session: { email: 'noneofyour@damn.biz', password: 'foobar'} } }

    it 'should sign in a user' do
      User.create(first_name: "Ron", last_name: "Swanson", email: "noneofyour@damn.biz", password: "foobar")
      get :create, valid
      expect(session[:remember_token]).to_not be_blank
    end

    it 'should redirect user' do
      User.create(first_name: "Ron", last_name: "Swanson", email: "allofyour@damn.biz", password: "foobar")
      get :create, valid
      expect(response.redirect_url).to include(root_path)
    end

  end
end
