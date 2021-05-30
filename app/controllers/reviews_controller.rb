# Reviews: users can add reviews for restaurants.
# Given a keyword, we want to search in reviews for that keyword.

class ReviewsController < ApplicationController
  # GET /reviews?search_terms=fun times
  def search
    return api_error('Missing Parameters', 400) unless review_params['search_terms']

    restaurants = Restaurant.search(review_params['search_terms'])
    json_response(restaurants: Serializers::Restaurant.index(restaurants))
  end

  # POST /reviews
  def create
    if !review_params['business_id'] || !review_params['text']
      return api_error('Missing Parameters', 400)
    end

    review =
      Review.new(
        user_id: @current_user.user_id,
        business_id: review_params[:business_id],
        review_id: SecureRandom.alphanumeric,
        text: review_params[:text],
        stars: review_params[:stars],
        useful: review_params[:useful],
        funny: review_params[:funny],
        cool: review_params[:cool],
        date: Date.current
      )

    if review.save
      json_response(review: review.as_json)
    else
      api_error('Unable to create review')
    end
  end

  private

  def review_params
    params.permit(
      :search_terms,
      :business_id,
      :user_id,
      :stars,
      :useful,
      :funny,
      :cool,
      :text
    )
  end
end
