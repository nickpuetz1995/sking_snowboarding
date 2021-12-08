require 'rails_helper'

RSpec.describe SkiAreaReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ski_area_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SkiAreaReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SkiAreaReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ski_area_review) { create(:ski_area_review) }

    let(:payload) do
      {
        data: {
          id: ski_area_review.id.to_s,
          type: 'ski_area_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SkiAreaReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ski_area_review.reload.updated_at }
      # .and change { ski_area_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ski_area_review) { create(:ski_area_review) }

    let(:instance) do
      SkiAreaReviewResource.find(id: ski_area_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SkiAreaReview.count }.by(-1)
    end
  end
end
