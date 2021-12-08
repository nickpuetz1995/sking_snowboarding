require 'rails_helper'

RSpec.describe "ski_areas#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ski_areas/#{ski_area.id}", payload
  end

  describe 'basic update' do
    let!(:ski_area) { create(:ski_area) }

    let(:payload) do
      {
        data: {
          id: ski_area.id.to_s,
          type: 'ski_areas',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SkiAreaResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ski_area.reload.attributes }
    end
  end
end
