require "rails_helper"

RSpec.describe "ski_area_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ski_area_reviews/#{ski_area_review.id}"
  end

  describe "basic destroy" do
    let!(:ski_area_review) { create(:ski_area_review) }

    it "updates the resource" do
      expect(SkiAreaReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SkiAreaReview.count }.by(-1)
      expect { ski_area_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
