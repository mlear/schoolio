require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

  let(:user) { create :valid_instructor }
  let(:course) { Course.create(subject: "Calculus", name: "Calc 101a") }

  pending '#update' do
    # #update just removes an instructor from a course.
    let(:course1) {{id: course.id, course: { subject: "Biology" }}}

    it 'updates course information' do
      sign_in user
      post :update, course1
      expect(assigns(:course).subject).to eq 'Biology'
      # expect(response.redirect?).to be true
    end
  end

  def sign_in(user)
    visit root_path
    fill_in "email",     with: user.email
    fill_in "password",  with: user.password
    click_button "sign_in"
  end

  def sign_out
    click_on 'log out'
  end

end
