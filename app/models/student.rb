class Student < ActiveRecord::Base
  has_secure_password
  has_many :grades
  has_many :courses, through: :grades

  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, format: { with: /\A\S+[@]\S+[.]\S+/ }
	belongs_to :learning_style
	has_many :wats
	has_many :instructors, through: :wats
	has_many :student_behaviors
	has_many :behavior_traits, through: :student_behaviors
	has_many :student_interests
	has_many :interests, through: :student_interests
end
