require 'rails_helper'

RSpec.describe 'Sensors API' do
  # Initialize the test data
  let!(:rebreather) { create(:rebreather) }
  let!(:sensors) { create_list(:sensor, 20, rebreather_id: rebreather.id) }
  let(:rebreather_id) { rebreather.id }
  let(:id) { sensors.first.id }

  # Test suite for GET /rebreathers/:rebreather_id/sensors
  describe 'GET /rebreathers/:rebreather_id/sensors' do
    before { get "/rebreathers/#{rebreather_id}/sensors" }

    context 'when rebreather exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all rebreather sensors' do
        expect(json.size).to eq(20)
      end
    end

    context 'when rebreather does not exist' do
      let(:rebreather_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rebreather/)
      end
    end
  end

  # Test suite for GET /rebreathers/:rebreather_id/sensors/:id
  describe 'GET /rebreathers/:rebreather_id/sensors/:id' do
    before { get "/rebreathers/#{rebreather_id}/sensors/#{id}" }

    context 'when rebreather sensor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the sensor' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when rebreather sensor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Sensor/)
      end
    end
  end

  # Test suite for PUT /rebreathers/:rebreather_id/sensors
  describe 'POST /rebreathers/:rebreather_id/sensors' do
    let(:valid_attributes) { { position: 2, serial_number: 'fdfsdfdsf6552fdsa', install_date: '2018-02-02' } }

    context 'when request attributes are valid' do
      before { post "/rebreathers/#{rebreather_id}/sensors", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/rebreathers/#{rebreather_id}/sensors", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Position can't be blank/)
      end
    end
  end

  # Test suite for PUT /rebreathers/:rebreather_id/sensors/:id
  describe 'PUT /rebreathers/:rebreather_id/sensors/:id' do
    let(:valid_attributes) { { serial_number: 'fdfsdfgds555d' } }

    before { put "/rebreathers/#{rebreather_id}/sensors/#{id}", params: valid_attributes }

    context 'when sensor exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the sensor' do
        updated_sensor = Sensor.find(id)
        expect(updated_sensor.serial_number).to match(/fdfsdfgds555d/)
      end
    end

    context 'when the sensor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Sensor/)
      end
    end
  end

  # Test suite for DELETE /rebreathers/:id
  describe 'DELETE /rebreathers/:id' do
    before { delete "/rebreathers/#{rebreather_id}/sensors/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end