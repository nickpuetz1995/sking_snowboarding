require "rails_helper"

RSpec.describe "non_ski_activities#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/non_ski_activities/#{non_ski_activity.id}", payload
  end

  describe "basic update" do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    let(:payload) do
      {
        data: {
          id: non_ski_activity.id.to_s,
          type: "non_ski_activities",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(NonSkiActivityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { non_ski_activity.reload.attributes }
    end
  end
end
