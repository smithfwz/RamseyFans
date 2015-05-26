class DishesController < ApplicationController

	def index
		@dishes = Dish.all

		if params[:search_form] && params[:search_form][:keyword]
			@keyword = params[:search_form][:keyword]
			@dishes = @dishes.search_by(params[:search_form][:keyword])
		end
	end

	def show
		@dish = Dish.find(dish_id) 
	end


	private

	def dish_id
		params.require(:id)
	end
end