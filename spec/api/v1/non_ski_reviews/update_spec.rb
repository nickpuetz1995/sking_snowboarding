require "rails_helper"

RSpec.describe "non_ski_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/non_ski_reviews/#{non_ski_review.id}", payload
  end

  describe "basic update" do
    let!(:non_ski_review) { create(:non_ski_review) }

    let(:payload) do
      {
        data: {
          id: non_ski_review.id.to_s,
          type: "non_ski_reviews",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(NonSkiReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { non_ski_review.reload.attributes }
    end
  end
end
