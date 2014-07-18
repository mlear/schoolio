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

  describe '#update' do

    let(:grade1) {{id: grade.id, grade: { gpa: 1.0 }}}


    context 'with form fill out' do

      it 'updates grade information' do
        post :update, grade1
        expect(assigns(:grade).gpa).to eq 1.0
        expect(response.redirect?).to be true
      end
    end
  end

end
