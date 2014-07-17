require 'rails_helper'

RSpec.describe GradesController, :type => :controller do

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

end
