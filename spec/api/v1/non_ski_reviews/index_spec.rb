require "rails_helper"

RSpec.describe "non_ski_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/non_ski_reviews", params: params
  end

  describe "basic fetch" do
    let!(:non_ski_review1) { create(:non_ski_review) }
    let!(:non_ski_review2) { create(:non_ski_review) }

    it "works" do
      expect(NonSkiReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["non_ski_reviews"])
      expect(d.map(&:id)).to match_array([non_ski_review1.id,
                                          non_ski_review2.id])
    end
  end
end
