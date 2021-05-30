require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant) }
  let!(:category) { create(:category) }
  let!(:restaurant_cateogry) { create(:restaurant_category, restaurant_id: restaurant.id, category_id: category.id) }
  let!(:review) { create(:review, business_id: restaurant.business_id, user_id: user.user_id) }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /categories
  # I am not testing for the accuracy of the data returned, just that there is data being returned
  describe 'GET /categories' do
    # make HTTP get request before each example
    # before { get '/categories', params: {}, headers: headers }

    it 'returns categories' do
      get '/categories', params: {}, headers: headers
      # Note `json` is a custom helper to parse JSON responses
      expect(json['categories']).not_to be_empty
      expect(json['categories'].size).to eq(1)
    end

    it 'returns restaurants when a category name is specified' do
      get '/categories', params: {name: category.name}, headers: headers
      # Note `json` is a custom helper to parse JSON responses
      expect(json['restaurants']).not_to be_empty
      expect(json['restaurants'].size).to eq(1)
    end

    it 'returns status code 200' do
      get '/categories', params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
