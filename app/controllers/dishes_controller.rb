class DishesController < ApplicationController

	def index
		@dishes = Dish.all

		if params[:search]
			@keyword = params[:search]
			@dishes = @dishes.search_by(params[:search])
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