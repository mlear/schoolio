require 'rails_helper'

system 'clear'

describe 'User pages' do

  context 'on the homepage' do

    it 'sees a login button' do
      visit '/'
      expect(page).to have_link signin_path
    end
  end
end
