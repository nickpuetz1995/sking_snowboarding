require "rails_helper"

RSpec.describe "ski_area_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ski_area_reviews/#{ski_area_review.id}", payload
  end

  describe "basic update" do
    let!(:ski_area_review) { create(:ski_area_review) }

    let(:payload) do
      {
        data: {
          id: ski_area_review.id.to_s,
          type: "ski_area_reviews",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SkiAreaReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ski_area_review.reload.attributes }
    end
  end
end
