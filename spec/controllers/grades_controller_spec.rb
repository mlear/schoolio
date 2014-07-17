require 'rails_helper'

RSpec.describe GradesController, :type => :controller do

  let(:grade) { Grade.create(user_id: 1, course_id: 1, gpa: 2.0) }

  describe "GET 'index'" do
    it "returns http success" do
      # get 'index'
      visit grades_url 
      expect(current_path.to_s).to eq('/grades')
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      grade_url(grade) 
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      visit new_grade_url
      expect(current_path.to_s).to eq('/grades/new')
    end
  end

end
