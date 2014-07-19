class Instructor < ActiveRecord::Base
  has_secure_password
  has_many :grades
  has_many :courses

  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, format: { with: /\A\S+[@]\S+[.]\S+/ }
	has_many :wats
	has_many :students, through: :wats
end
