class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, format: { with: /\A\S+[@]\S+[.]\S+/ }
end

