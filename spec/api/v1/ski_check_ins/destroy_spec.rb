require 'rails_helper'

RSpec.describe "ski_check_ins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ski_check_ins/#{ski_check_in.id}"
  end

  describe 'basic destroy' do
    let!(:ski_check_in) { create(:ski_check_in) }

    it 'updates the resource' do
      expect(SkiCheckInResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SkiCheckIn.count }.by(-1)
      expect { ski_check_in.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
