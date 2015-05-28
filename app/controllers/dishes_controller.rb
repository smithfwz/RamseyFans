class DishesController < ApplicationController

	before_action :authenticate_fan!, except: [:index, :show]

	def index
		@dishes = Dish.all

		if search_keyword
			@keyword = search_keyword
			@dishes = @dishes.search_by(@keyword)
		end
	end

	def show
		@dish = Dish.find(dish_id) 
	end

	# def new
	# 	@dish = Dish.new
	# end

	# def create
	# 	@dish = Dish.new(dish_params)
	# 	if @dish.save
	# 		redirect_to dishes_url
	# 	else
	# 		render :new
	# 	end
	# end

	private

	def dish_id
		params.require(:id)
	end

	def search_keyword
		params[:search_form] && params[:search_form][:keyword]
	end

	def dish_params
		params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :fan_id)
	end
end