class DishesController < ApplicationController
	before_action :authenticate_fan!, except: [:index, :show]

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

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new(params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian))
		if @dish.save
			redirect_to dishes_url
		else
			render :new
		end
	end


	private

	def dish_id
		params.require(:id)
	end
end