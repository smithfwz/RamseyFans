require 'rails_helper'

RSpec.describe 'User can view dishes' do 
	let!(:dish) { create(:dish, title: 'Pho', pax: 2000) }

	describe 'User can view dishes listing' do 

		it 'view dishes listing' do
			visit '/dishes'
			expect(page).to have_content 'Pho'
		end
	end

	describe 'User can view dish detail' do 
		
		it 'view dish' do 
			visit '/dishes'
			expect(page).not_to have_content '2000'

			click_on 'Detail'
			expect(page).to have_content '2000'
		end
	end
end