require 'rails_helper'

RSpec.describe SkiCheckInResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ski_check_ins',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SkiCheckInResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SkiCheckIn.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ski_check_in) { create(:ski_check_in) }

    let(:payload) do
      {
        data: {
          id: ski_check_in.id.to_s,
          type: 'ski_check_ins',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SkiCheckInResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ski_check_in.reload.updated_at }
      # .and change { ski_check_in.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ski_check_in) { create(:ski_check_in) }

    let(:instance) do
      SkiCheckInResource.find(id: ski_check_in.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SkiCheckIn.count }.by(-1)
    end
  end
end
