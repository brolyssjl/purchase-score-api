require 'rails_helper'

RSpec.describe 'PurchaseScores API', type: :request do
  # initialize test data
  before(:all) do
    Rails.application.load_seed
  end
  let(:purchase_id) { 1 }

  # Test suite for GET /purchasescores/:purchase_id
  describe 'GET /purchasescores/:purchase_id' do
    before { get "/purchasescores/#{purchase_id}" }

    context 'when the record exists' do
      it 'returns the purchase score' do
        expect(response.body).not_to be_empty
        purchase_score = JSON.parse(response.body)
        expect(purchase_score['id']).to eq(purchase_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:purchase_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PurchaseScore with 'id'=100/)
      end
    end
  end
end