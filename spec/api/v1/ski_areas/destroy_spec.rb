require "rails_helper"

RSpec.describe "ski_areas#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ski_areas/#{ski_area.id}"
  end

  describe "basic destroy" do
    let!(:ski_area) { create(:ski_area) }

    it "updates the resource" do
      expect(SkiAreaResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SkiArea.count }.by(-1)
      expect { ski_area.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
