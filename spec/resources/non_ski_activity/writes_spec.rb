require "rails_helper"

RSpec.describe NonSkiActivityResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "non_ski_activities",
          attributes: {},
        },
      }
    end

    let(:instance) do
      NonSkiActivityResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { NonSkiActivity.count }.by(1)
    end
  end

  describe "updating" do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    let(:payload) do
      {
        data: {
          id: non_ski_activity.id.to_s,
          type: "non_ski_activities",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      NonSkiActivityResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { non_ski_activity.reload.updated_at }
      # .and change { non_ski_activity.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    let(:instance) do
      NonSkiActivityResource.find(id: non_ski_activity.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { NonSkiActivity.count }.by(-1)
    end
  end
end
