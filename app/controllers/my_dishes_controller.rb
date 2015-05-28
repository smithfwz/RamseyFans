class MyDishesController < ApplicationController
	before_action :authenticate_fan!
  before_action :check_ownership_of_my_dish!, only: [:edit, :update]

  def index
    @my_dishes = Dish.where(fan_id: fan_id)
    @my_dishes = @my_dishes.order(title: :asc)
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

  def edit
    @my_dish = get_my_dish
    render :new
  end

  def update
    @my_dish = get_my_dish
    if @my_dish.update(my_dish_params)
      flash[:notice] = "You have Successfully Update your dish"
      redirect_to my_dishes_url
    else
      flash.now[:alert] = "There's an error on updating, please try again."
      render :new
    end
  end

  private

  def dish_id
    params.require(:id)
  end

  def fan_id
    current_fan.id
  end

  def my_dish_params
    params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :fan_id)
  end

  def get_my_dish
    @my_dish ||= Dish.find(dish_id)
  end

  def check_ownership_of_my_dish!
    if current_fan.id != get_my_dish.fan_id
      redirect_to my_dishes_url, notice: "You do not have the permission"
    end
  end
end