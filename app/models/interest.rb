class Interest < ActiveRecord::Base
	has_many :student_interests
	has_many :students, through: :student_interests
end
