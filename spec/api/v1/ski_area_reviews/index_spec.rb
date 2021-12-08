require 'rails_helper'

RSpec.describe "ski_area_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_area_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:ski_area_review1) { create(:ski_area_review) }
    let!(:ski_area_review2) { create(:ski_area_review) }

    it 'works' do
      expect(SkiAreaReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['ski_area_reviews'])
      expect(d.map(&:id)).to match_array([ski_area_review1.id, ski_area_review2.id])
    end
  end
end
