class StudentInterest < ActiveRecord::Base

	belongs_to :student
	belongs_to :interest

end
