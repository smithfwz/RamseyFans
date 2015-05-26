require 'rails_helper'

RSpec.describe DishesController, type: :controller do 

	describe '#index' do

		let!(:dishes) { create_list(:dish, 3) }
		let!(:pho_dish) { create(:dish, title: 'Pho Ga' ) }

		it 'gets a list of dishes' do 
			get :index
			expect(assigns(:dishes).size).to eq dishes.size
		end

		it 'show a dish from the search result' do 
			get :index, search_form: {keyword: "pho"}

			expect(assigns(:dishes).first.title).to eq 'Pho Ga'
		end
	end

	describe '#show' do 
		let!(:dish) { create(:dish) }

		it 'display a dishes' do 
			get :show, id: dish
			expect(assigns(:dish).id).to eq dish.id
		end
	end
end