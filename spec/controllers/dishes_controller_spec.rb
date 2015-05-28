require 'rails_helper'

RSpec.describe DishesController, type: :controller do 

	describe '#index' do

		let!(:dishes)   { create_list(:dish, 2, title: 'Bun bo') }

		it 'gets a list of dishes' do 
			get :index
			expect(assigns(:dishes).size).to eq Dish.all.count
		end

		context 'Search' do
			let!(:pho_dish) { create(:dish, title: 'Pho Ga' ) }

			it 'show a dish from the search result' do 
				get :index, search_form: {keyword: "pho"}
				expect(assigns(:dishes).first.title).to eq 'Pho Ga'
				expect(assigns(:dishes).count).to eq 1
			end
		end
	end

	describe '#show' do 
		let!(:dish) { create(:dish) }

		it 'display a dishes' do 
			get :show, id: dish
			expect(assigns(:dish).id).to eq dish.id
		end
	end

	describe '#new' do 
		context 'Success' do 
			let!(:fan) { create(:fan) }
			before { sign_in fan }

			it 'fan login' do 
				get :new
				expect(assigns(:dish)).to be_a Dish
			end
		end

		context 'Fail' do 
			it 'render new fan on failure' do 
				get :new
				expect(response).to redirect_to new_fan_session_url
			end
		end
	end

	describe '#create' do
		def do_request
			post :create, dish: params
		end

		let!(:fan) 	 { create(:fan) }
		before { sign_in fan }
		
		context 'Success' do 
			let(:params) { build(:dish).attributes }

			it 'save a dish' do 
				expect{ do_request }.to change(Dish, :count).by(1)
				expect(response).to redirect_to dishes_url
			end
		end

		context 'Failure' do
			let(:params) { build(:dish, title: '').attributes }

			it 'should not save the dish' do
				expect{ do_request }.not_to change(Dish, :count)
				expect(response).to render_template :new
			end
		end
	end

end