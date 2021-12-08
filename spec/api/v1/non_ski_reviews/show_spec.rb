require "rails_helper"

RSpec.describe "non_ski_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/non_ski_reviews/#{non_ski_review.id}", params: params
  end

  describe "basic fetch" do
    let!(:non_ski_review) { create(:non_ski_review) }

    it "works" do
      expect(NonSkiReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("non_ski_reviews")
      expect(d.id).to eq(non_ski_review.id)
    end
  end
end
