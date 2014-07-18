require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

  let(:course) { Course.create(subject: "Calculus", name: "Calc 101a") }

  describe "GET 'index'" do
    it "returns http success" do
      # get 'index'
      visit courses_url 
      expect(current_path).to eq('/courses')
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      course_url(course) 
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      visit new_course_url
      expect(current_path).to eq('/courses/new')
    end
  end

  describe '#update' do

    let(:course1) {{id: course.id, course: { subject: "Biology" }}}


    context 'with form fill out' do

      it 'updates course information' do
        post :update, course1
        expect(assigns(:course).subject).to eq 'Biology'
        expect(response.redirect?).to be true
      end
    end
  end

end
