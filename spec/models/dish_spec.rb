require 'rails_helper'

RSpec.describe Dish, type: :model do

	context 'Validation' do 
		it { should validate_presence_of :title }
		it { should validate_presence_of :description }
		it { should validate_numericality_of(:cost).is_greater_than(0) }
		it { should validate_numericality_of(:pax).is_greater_than(0).only_integer }
	end

	context 'search_by' do 
		let!(:bun_dish) { create(:dish, title: 'Bun Bo') }
		let!(:pho_dish) { create(:dish, title: 'Pho Ga' ) }
		it 'search' do
			expect(Dish.search_by('pho').first.title).to eq 'Pho Ga'
		end
	end
end