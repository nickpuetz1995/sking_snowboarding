require "rails_helper"

RSpec.describe "ski_check_ins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_check_ins/#{ski_check_in.id}", params: params
  end

  describe "basic fetch" do
    let!(:ski_check_in) { create(:ski_check_in) }

    it "works" do
      expect(SkiCheckInResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("ski_check_ins")
      expect(d.id).to eq(ski_check_in.id)
    end
  end
end
