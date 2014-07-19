require 'rails_helper'

describe Student do

  let(:student) { create :valid_student }
  let(:course) { create :course }

  it 'has many courses' do
    student.courses << course
    expect(student.courses.first).to be_a Course
  end

  it {should have_many(:courses)}
  it {should have_many(:grades)}

end
