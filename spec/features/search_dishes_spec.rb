require 'rails_helper'

RSpec.describe 'User can search dishes' do 
	describe 'User can search dishes' do 
		let!(:com_dish) { create(:dish, title: 'Com Tam') }
		let!(:pho_dish) { create(:dish, title: 'Pho Ga') }

		it 'search' do 
			visit '/dishes'

			expect(page).to have_content 'chicken'

			fill_in 'search_form[keyword]', with: 'pho'
			click_on 'Search'

			expect(page).to have_content 'Pho'
			expect(page).not_to have_content 'Com Tam'
		end
	end
end