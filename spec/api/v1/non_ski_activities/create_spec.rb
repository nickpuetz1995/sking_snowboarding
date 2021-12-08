require 'rails_helper'

RSpec.describe "non_ski_activities#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/non_ski_activities", payload
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
          type: 'non_ski_activities',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NonSkiActivityResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { NonSkiActivity.count }.by(1)
    end
  end
end
