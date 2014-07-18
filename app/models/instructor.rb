class Instructor < ActiveRecord::Base
	has_many :users, as: :role
end
