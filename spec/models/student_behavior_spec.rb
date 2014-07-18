require 'rails_helper'

describe StudentBehavior do
	
	it {should belong_to(:student)}
	it {should belong_to(:behavior_trait)}
	
end
