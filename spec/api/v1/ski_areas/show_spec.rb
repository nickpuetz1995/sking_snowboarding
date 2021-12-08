require 'rails_helper'

RSpec.describe "ski_areas#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_areas/#{ski_area.id}", params: params
  end

  describe 'basic fetch' do
    let!(:ski_area) { create(:ski_area) }

    it 'works' do
      expect(SkiAreaResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('ski_areas')
      expect(d.id).to eq(ski_area.id)
    end
  end
end
