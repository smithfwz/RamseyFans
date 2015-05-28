require 'rails_helper'

RSpec.describe 'Fan can crud their own dish' do 
	describe 'Fan can crud their own dish' do 
		let!(:fan)  { create(:fan) }
		let!(:dish) { build(:dish, title: 'rice') }

		it 'login and crud their own dish' do 
			visit '/'

			click_on 'Sign in'

			fill_in 'fan[email]', 	 with: fan.email
			fill_in 'fan[password]', with: fan.password

			click_on 'Log in'
			
			expect(page).to have_content 'Signed in successfully.'

			click_on 'Create a dish'

			expect(page).not_to have_content 'pho ga'

			fill_in 'Title', 			 with: 'pho ga'
			fill_in 'Description', with: 'this is pho ga'
			fill_in 'Cost', 			 with: 12.22
			fill_in 'Pax', 				 with: 2

			click_on 'Submit'

			expect(page).to have_content 'pho ga'

			click_on 'Detail'
			click_on 'Edit dish'

			fill_in 'Title', 			 with: 'hu tieu'
			fill_in 'Description', with: 'this is hu tieu'
			fill_in 'Cost', 			 with: 12.22
			fill_in 'Pax', 				 with: 2
			check 'dish[vegetarian]'

			click_on 'Submit'

			expect(page).to have_content 'hu tieu'
		end
	end

end