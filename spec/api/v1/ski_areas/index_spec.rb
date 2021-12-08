require 'rails_helper'

RSpec.describe "ski_areas#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_areas", params: params
  end

  describe 'basic fetch' do
    let!(:ski_area1) { create(:ski_area) }
    let!(:ski_area2) { create(:ski_area) }

    it 'works' do
      expect(SkiAreaResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['ski_areas'])
      expect(d.map(&:id)).to match_array([ski_area1.id, ski_area2.id])
    end
  end
end
