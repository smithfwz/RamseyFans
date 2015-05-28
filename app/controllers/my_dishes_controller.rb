class MyDishesController < ApplicationController
	before_action :authenticate_fan!
  # before_action :check_ownership_of_my_dish!, only: [:edit, :update]

  def index
    @my_dishes = Dish.where(fan_id: fan_id)
    @my_dishes = @my_dishes.order(title: :desc)
  end

  def new
    @my_dish = Dish.new
  end

  def create
    @my_dish = Dish.new(my_dish_params.merge(fan_id: fan_id))
    # @my_dish.published = true
    if @my_dish.save
      redirect_to my_dishes_url, notice: 'You have successfully created your dish!'
    else
      flash.now[:alert] = 'There is an error during creation, please try again.'
      render :new
    end
  end

  private

  def fan_id
    current_fan.id
  end

  def my_dish_params
    params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :fan_id)
  end
end