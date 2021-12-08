require 'rails_helper'

RSpec.describe "ski_check_ins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ski_check_ins", params: params
  end

  describe 'basic fetch' do
    let!(:ski_check_in1) { create(:ski_check_in) }
    let!(:ski_check_in2) { create(:ski_check_in) }

    it 'works' do
      expect(SkiCheckInResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['ski_check_ins'])
      expect(d.map(&:id)).to match_array([ski_check_in1.id, ski_check_in2.id])
    end
  end
end
