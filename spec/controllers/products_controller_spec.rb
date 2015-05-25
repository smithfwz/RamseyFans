require 'rails_helper'

RSpec.describe DishesController, type: :controller do 

	describe '#index' do

		let!(:dishes) { create_list(:dish, 3) }

		it 'gets a list of dishes' do 
			get :index
			expect(assigns(:dishes).size).to eq dishes.size
		end
	end
end