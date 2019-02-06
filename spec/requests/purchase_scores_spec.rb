require 'rails_helper'

RSpec.describe 'PurchaseScores API', type: :request do
  # initialize test data
  let(:id) { 1 }
  before(:all) do
    Rails.application.load_seed
  end

  # Test suite for GET /purchasescores/:id
  describe 'GET /purchasescores/:id' do
    before { get "/purchasescores/#{id}" }

    context 'when the record exists' do
      it 'returns the purchase score' do
        expect(response.body).not_to be_empty
        purchase_score = JSON.parse(response.body)
        expect(purchase_score['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

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

  # Test suite for PUT /purchasescores/:id
  describe 'PUT /purchasescores/:id' do
    let(:valid_attributes) { { score: 3, description: 'Excelente producto, pero la atención fue muy mala' } }

    context 'when the record exists' do
      before { put "/purchasescores/#{id}", params: valid_attributes }

      it 'updates the record' do
        purchase_score = JSON.parse(response.body)

        expect(purchase_score['score']).to eq(3)
        expect(purchase_score['description']).to eq('Excelente producto, pero la atención fue muy mala')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /purchasescores/:id
  describe 'DELETE /purchasescores/:id' do
    before { delete "/purchasescores/#{id}" }

    it 'updates the record' do
      purchase_score = JSON.parse(response.body)

      expect(purchase_score['deleted']).to eq(true)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end