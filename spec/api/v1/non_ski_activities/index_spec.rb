require 'rails_helper'

RSpec.describe "non_ski_activities#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/non_ski_activities", params: params
  end

  describe 'basic fetch' do
    let!(:non_ski_activity1) { create(:non_ski_activity) }
    let!(:non_ski_activity2) { create(:non_ski_activity) }

    it 'works' do
      expect(NonSkiActivityResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['non_ski_activities'])
      expect(d.map(&:id)).to match_array([non_ski_activity1.id, non_ski_activity2.id])
    end
  end
end
