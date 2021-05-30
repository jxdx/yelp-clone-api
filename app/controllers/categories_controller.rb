# Given a category (Mexican, Burgers, Gastropubs, etc.), we want to list restaurants in that category sorted by most interesting.
# You can define what "interesting" means.

class CategoriesController < ApplicationController
  before_action :find_category
  # GET /categories
  # To get a list of all available categories use the /categories endpoint
  # To get restaurants by category you need to pass the name parameter
  def index
    if category_params[:name]
      return api_error('Category not found') if @category.nil?

      # Return restaurants for a given category sorted by
      # the restaurant with the most reviews and highest rating
      restaurants = @category.restaurants.order(review_count: :desc, stars: :desc)
      json_response(restaurants: Serializers::Restaurant.index(restaurants))
    else
      categories = Category.all
      json_response(categories: Serializers::Category.index(categories))
    end
  end

  private

  def find_category
    @category = Category.find_by(name: category_params[:name]) if category_params[:name]
  end

  def category_params
    params.permit(:name)
  end
end
