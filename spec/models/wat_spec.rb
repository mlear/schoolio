require 'rails_helper'

describe Wat do
	it {should belong_to(:student)}
	it {should belong_to(:instructor)}
end
