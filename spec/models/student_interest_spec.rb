require 'rails_helper'

describe StudentInterest do

	it {should belong_to(:student)}
	it {should belong_to(:interest)}

end
