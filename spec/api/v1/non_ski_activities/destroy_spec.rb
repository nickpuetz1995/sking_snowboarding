require "rails_helper"

RSpec.describe "non_ski_activities#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/non_ski_activities/#{non_ski_activity.id}"
  end

  describe "basic destroy" do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    it "updates the resource" do
      expect(NonSkiActivityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { NonSkiActivity.count }.by(-1)
      expect { non_ski_activity.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
