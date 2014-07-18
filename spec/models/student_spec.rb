require 'rails_helper'

describe Student do

	it {should have_many(:users)}
	it {should belong_to(:learning_style)}
	it {should have_many(:behavior_traits)}
	it {should have_many(:student_behaviors)}
	it {should have_many(:interests)}
	it {should have_many(:student_interests)}


end

