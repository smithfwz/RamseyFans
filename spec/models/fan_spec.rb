require 'rails_helper'

RSpec.describe Fan, type: :model do
	it { should have_many(:dishes) }
end