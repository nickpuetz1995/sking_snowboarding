require 'rails_helper'

RSpec.describe "non_ski_reviews#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/non_ski_reviews", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'non_ski_reviews',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NonSkiReviewResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { NonSkiReview.count }.by(1)
    end
  end
end
