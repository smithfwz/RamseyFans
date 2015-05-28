require 'rails_helper'

RSpec.describe 'Fan can sign up' do 
	describe 'Fan can sign up' do 
		it 'sign up' do
			visit '/'

			click_on 'Sign up'

			expect(Fan.all.count).to eq 0

			fill_in 'fan[email]', 								with: 'smith@futureworkz.com'
			fill_in 'fan[password]', 							with: '123123123'
			fill_in 'fan[password_confirmation]', with: '123123123'

			click_on 'Register'

			expect(Fan.all.count).to eq 1
			expect(page).to have_content 'Please follow the link to activate your account.'
		end
	end

	describe 'Fan can login' do 
		let!(:fan_smith) { create(:fan) }
		
		it 'login' do 
			visit '/'

			click_on 'Login'

			expect(page).not_to have_content 'Signed in successfully.'

			fill_in 'fan[email]', 	 with: 'smith@futureworkz.com'
			fill_in 'fan[password]', with: '123123123'

			click_on 'Log in'
			
			expect(page).to have_content 'Signed in successfully.'
		end
	end
end