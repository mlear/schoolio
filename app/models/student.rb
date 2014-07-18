class Student < User
	validates_presence_of :learning_style_id, :behavior_trait_id, :interest_id, :grade, :school_name 	
	belongs_to :learning_style
	has_many :wats
	has_many :instructors, through: :wats
	has_many :student_behaviors
	has_many :behavior_traits, through: :student_behaviors
	has_many :student_interests
	has_many :interests, through: :student_interests
end
