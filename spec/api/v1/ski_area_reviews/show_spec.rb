require 'rails_helper'

RSpec.describe "ski_area_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_area_reviews/#{ski_area_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:ski_area_review) { create(:ski_area_review) }

    it 'works' do
      expect(SkiAreaReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('ski_area_reviews')
      expect(d.id).to eq(ski_area_review.id)
    end
  end
end
