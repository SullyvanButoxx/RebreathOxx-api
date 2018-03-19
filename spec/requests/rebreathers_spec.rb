require 'rails_helper'

RSpec.describe 'Rebreathers API', type: :request do
  # initialize test data 
  let!(:rebreathers) { create_list(:rebreather, 10) }
  let(:rebreather_id) { rebreathers.first.id }

  # Test suite for GET /rebreathers
  describe 'GET /rebreathers' do
    # make HTTP get request before each example
    before { get '/rebreathers' }

    it 'returns rebreathers' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /rebreathers/:id
  describe 'GET /rebreathers/:id' do
    before { get "/rebreathers/#{rebreather_id}" }

    context 'when the record exists' do
      it 'returns the rebreathers' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(rebreather_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:rebreather_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rebreather/)
      end
    end
  end

  # Test suite for POST /rebreathers
  describe 'POST /rebreathers' do
    # valid payload
    let(:valid_attributes) { { name: 'Revo III standard'} }

    context 'when the request is valid' do
      before { post '/rebreathers', params: valid_attributes }

      it 'creates a rebreather' do
        expect(json['name']).to eq('Revo III standard')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/rebreathers', params: { name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /rebreathers/:id
  describe 'PUT /rebreathers/:id' do
    let(:valid_attributes) { { name: 'Revo II standard' } }

    context 'when the record exists' do
      before { put "/rebreathers/#{rebreather_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /rebreathers/:id
  describe 'DELETE /rebreathers/:id' do
    before { delete "/rebreathers/#{rebreather_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end