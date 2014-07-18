require 'rails_helper'

describe Interest do

	it {should have_many(:students)}
	it {should have_many(:student_interests)}

end
