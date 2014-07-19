class Course < ActiveRecord::Base
	has_many :grades
  has_many :students, through: :grades
	belongs_to :instructor
end
