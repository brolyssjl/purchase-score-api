require 'rails_helper'

RSpec.describe 'PurchaseScores API', type: :request do
  # initialize test data
  let(:purchase_id) { 1 }
  let(:user_id) { 12 }
  let(:shop_id) { 13 }
  before(:all) do
    Rails.application.load_seed
  end

  # Test suite for GET /scores/purchases/:purchase_id
  describe 'GET /scores/purchases/:purchase_id' do
    before { get "/scores/purchases/#{purchase_id}" }

    context 'when the record exists' do
      it 'returns the score or opinion' do
        expect(response.body).not_to be_empty
        purchase_score = JSON.parse(response.body)
        expect(purchase_score['id']).to eq(purchase_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:purchase_id) { 543 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Purchase Score with 'purchase_id'=543/)
      end
    end
  end

  # Test suite for GET /scores/users/:user_id
  describe 'GET /scores/users/:user_id' do
    before {
      get "/scores/users/#{user_id}",
      params: { start: 1.day.ago, end: Time.now }
    }

    context 'when the record exists' do
      it 'returns the score or opinion' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 1231 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User Scores/)
      end
    end
  end

  # Test suite for GET /scores/shops/:shop_id
  describe 'GET /scores/shops/:shop_id' do
    before {
      get "/scores/shops/#{shop_id}",
      params: { start: 1.day.ago, end: Time.now }
    }

    context 'when the record exists' do
      it 'returns the score or opinion' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:shop_id) { 66 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shop Scores/)
      end
    end
  end
end