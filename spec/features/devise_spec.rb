require 'rails_helper'

RSpec.describe 'User can sign up' do 

	describe 'User can sign up' do 


		it 'sign up' do
			visit '/'

			click_on 'Sign up'

			expect(page).not_to have_content 'smith@futureworkz.com'

			fill_in 'fan[email]', with: 'smith@futureworkz.com'
			fill_in 'fan[password]', with: '123123123'
			fill_in 'fan[password_confirmation]', with: '123123123'

			click_on 'Register'
			
			expect(page).to have_content 'smith@futureworkz.com'
		end
	end
end