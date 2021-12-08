require 'rails_helper'

RSpec.describe "ski_areas#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/ski_areas", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'ski_areas',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SkiAreaResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SkiArea.count }.by(1)
    end
  end
end
