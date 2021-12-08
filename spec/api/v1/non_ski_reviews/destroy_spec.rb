require 'rails_helper'

RSpec.describe "non_ski_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/non_ski_reviews/#{non_ski_review.id}"
  end

  describe 'basic destroy' do
    let!(:non_ski_review) { create(:non_ski_review) }

    it 'updates the resource' do
      expect(NonSkiReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { NonSkiReview.count }.by(-1)
      expect { non_ski_review.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
