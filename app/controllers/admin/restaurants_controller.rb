class Admin::RestaurantsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	before_action :set_restaurant, only: [:show, :edit, :update]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			flash[:notice] = "restaurant was successfully created"
			redirect_to admin_restaurants_path
		else
			flash.now[:alert] = "restaurant was failed to create"
			render :new
		end
	end

	def update
		if @restaurant.update(restaurant_params)
			flash[:notice] = "restaurant was successfully created"
			redirect_to admin_restaurants_path
		else
			flash.now[:alert] = "restaurant was failed to create"
			render :edit
		end

	end

	private 

	def restaurant_params
		params.require(:restaurant).permit(:name, :tel, :opening_hours, :description, :address)
	end

	def set_restaurant
		@restaurant = Restaurant.find(params[:id])
	end
end
