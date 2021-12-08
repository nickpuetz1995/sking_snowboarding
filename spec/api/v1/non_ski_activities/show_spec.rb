require 'rails_helper'

RSpec.describe "non_ski_activities#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/non_ski_activities/#{non_ski_activity.id}", params: params
  end

  describe 'basic fetch' do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    it 'works' do
      expect(NonSkiActivityResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('non_ski_activities')
      expect(d.id).to eq(non_ski_activity.id)
    end
  end
end
