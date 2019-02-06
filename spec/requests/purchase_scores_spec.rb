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

  # Test suite for POST /purchasescores
  describe 'POST /purchasescores' do
    # valid payload
    let(:valid_attributes) { {
        score: 5,
        description: 'Excelente calidad del producto!!!',
        user_id: 5,
        shop_id: 7,
        purchase_id: 11
    } }

    context 'when the request is valid' do
      before { post '/purchasescores', params: valid_attributes }

      it 'creates a purchase score' do
        purchase_score = JSON.parse(response.body)

        expect(purchase_score['score']).to eq(5)
        expect(purchase_score['description']).to eq('Excelente calidad del producto!!!')
        expect(purchase_score['user_id']).to eq(5)
        expect(purchase_score['shop_id']).to eq(7)
        expect(purchase_score['purchase_id']).to eq(11)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/purchasescores', params: { description: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Score can't be blank, Score is not a number, Description can't be blank, User can't be blank, Shop can't be blank, Purchase can't be blank/)
      end
    end
  end

end