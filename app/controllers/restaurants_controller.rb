class RestaurantsController < ApplicationController
  # GET /restaurants
  def index
    restaurants = Restaurant.includes(:categories)
    json_response(restaurants: Serializers::Restaurant.index(restaurants, false))
  end

  # GET /restaurants/:business_id
  def show
    restaurant =
      Restaurant.includes([:categories, :reviews])
                .find_by(business_id: restaurant_params[:business_id])
    json_response(restaurant: Serializers::Restaurant.show(restaurant, true))
  end

  private

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
