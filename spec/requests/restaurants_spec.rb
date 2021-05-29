require 'rails_helper'

RSpec.describe 'Restaurants API', type: :request do
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant) }
  let(:category) { create(:category)}
  let!(:restaurant_cateogry) { create(:restaurant_category, restaurant_id: restaurant.id, category_id: category.id) }
  let!(:review) { create(:review, business_id: restaurant.business_id, user_id: user.user_id) }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /restaurants
  describe 'GET /restaurants' do
    # make HTTP get request before each example
    before { get '/restaurants', params: {}, headers: headers }

    it 'returns restaurants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['restaurants']).not_to be_empty
      expect(json['restaurants'].size).to eq(1)
      expect(json['restaurants'][0]['categories']).not_to be_empty
      expect(json['restaurants'][0]['reviews']).to eq('request restaurant details for reviews')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /restaurants/:business_id' do
    # make HTTP get request before each example
    before { get "/restaurants/#{restaurant.business_id}", params: {}, headers: headers }

    it 'returns restaurants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['restaurant']).not_to be_empty
      expect(json['restaurant']['categories']).not_to be_empty
      expect(json['restaurant']['reviews']).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
