require 'rails_helper'

describe BehaviorTrait do

	it {should have_many(:students)}
	it {should have_many(:student_behaviors)}

end
