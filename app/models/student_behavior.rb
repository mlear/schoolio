class StudentBehavior < ActiveRecord::Base
	belongs_to :student
	belongs_to :behavior_trait
end
