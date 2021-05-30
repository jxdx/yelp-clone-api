require 'rails_helper'

RSpec.describe 'Reviews API', type: :request do
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant) }
  let(:restaurant2) { create(:restaurant) }
  let(:text) { 'Great Friday night spot'}
  let(:search_terms) { 'Friday night' }
  let!(:review) { create(:review, business_id: restaurant.business_id, user_id: user.user_id, text: text) }
  let(:text2) { 'Great spot'}
  let!(:review2) { create(:review, business_id: restaurant2.business_id, user_id: user.user_id, text: text2) }
  let(:valid_attributes) do
    {
      business_id: restaurant.business_id,
      user_id: user.user_id,
      text: 'this is a new review'
    }
  end
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /reviews
  # I am not testing for the accuracy of the data returned, just that there is data being returned
  describe 'GET /reviews' do
    # make HTTP get request before each example
    before { get '/reviews', params: { search_terms: search_terms }, headers: headers }

    it 'returns restaurants that have reviews with the passed search terms' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['restaurants']).not_to be_empty
      expect(json['restaurants'].size).to eq(1)
      expect(json['restaurants'][0]['business_id']).to eq(restaurant.business_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /reviews' do
    context 'when valid request' do
      before { post '/reviews', params: valid_attributes.to_json, headers: headers }

      it 'creates a new review' do
        expect(response).to have_http_status(200)
      end

      it 'returns a new review' do
        expect(json['review']).not_to be_nil
        expect(json['review']['business_id']).to eq(review.business_id)
        expect(json['review']['user_id']).to eq(review.user_id)
        expect(json['review']['text']).to eq(valid_attributes[:text])
      end
    end

    context 'when an invalid request' do
      before { post '/reviews', params: {}, headers: headers }

      it 'does not create the review' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
