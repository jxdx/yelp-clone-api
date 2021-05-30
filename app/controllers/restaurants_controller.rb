class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: :show
  # GET /restaurants
  def index
    restaurants = Restaurant.includes(:categories)
    json_response(restaurants: Serializers::Restaurant.index(restaurants))
  end

  # GET /restaurants/:business_id
  def show
    return api_error('Restaurant not found') if @restaurant.nil?

    json_response(restaurant: Serializers::Restaurant.show(@restaurant))
  end

  private

  def find_restaurant
    @restaurant =
      Restaurant.includes([:categories, :reviews])
                .find_by(business_id: restaurant_params[:business_id])
  end

  def restaurant_params
    params.permit(
      :id,
      :business_id,
      :name,
      :address,
      :city,
      :state,
      :postal_code,
      :latitude,
      :longitude,
      :stars,
      :review_count,
      :is_open,
      :restaurant_attributes,
      :hours
    )
  end
end
