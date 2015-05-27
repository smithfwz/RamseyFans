require 'rails_helper'

RSpec.describe 'Fan can create a dish' do 

	describe 'Fan can create a dish' do 
		let!(:fan) { create(:fan) }
		let!(:dish) {  build(:dish, title: 'rice') }

		it 'login and create a dish' do 
			visit '/'

			click_on 'Login'

			fill_in 'fan[email]', 	 with: 'smith@futureworkz.com'
			fill_in 'fan[password]', with: '123123123'

			click_on 'Log in'
			
			expect(page).to have_content 'Signed in successfully.'

			click_on 'Create a dish'

			expect(page).not_to have_content 'pho ga'

			fill_in 'Title', 			 with: 'pho ga'
			fill_in 'Description', with: 'this is pho ga'
			fill_in 'Cost', 			 with: 12.22
			fill_in 'Pax', 				 with: 2

			click_on 'Create Dish'

			expect(page).to have_content 'pho ga'

		end
	end
end