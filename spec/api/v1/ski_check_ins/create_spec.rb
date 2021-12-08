require 'rails_helper'

RSpec.describe "ski_check_ins#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/ski_check_ins", payload
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
          type: 'ski_check_ins',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SkiCheckInResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SkiCheckIn.count }.by(1)
    end
  end
end
