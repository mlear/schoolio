require 'rails_helper'

describe Instructor do

	it {should have_many(:wats)}
	it {should have_many(:students)}

end

