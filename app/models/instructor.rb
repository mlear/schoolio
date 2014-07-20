class Instructor < ActiveRecord::Base
  include UsersHelper
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  has_many :grades
  has_many :courses

  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email
  validates :password, confirmation: true, on: :create
  validates :email, format: { with: /\A\S+[@]\S+[.]\S+/ }
	has_many :wats
	has_many :students, through: :wats
end
