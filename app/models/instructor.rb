class Instructor < User
	has_many :wats
	has_many :students, through: :wats
end
