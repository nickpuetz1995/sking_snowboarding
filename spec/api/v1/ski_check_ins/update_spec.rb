require "rails_helper"

RSpec.describe "ski_check_ins#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ski_check_ins/#{ski_check_in.id}", payload
  end

  describe "basic update" do
    let!(:ski_check_in) { create(:ski_check_in) }

    let(:payload) do
      {
        data: {
          id: ski_check_in.id.to_s,
          type: "ski_check_ins",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SkiCheckInResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ski_check_in.reload.attributes }
    end
  end
end
