require 'rails_helper'

RSpec.describe NonSkiReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'non_ski_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NonSkiReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { NonSkiReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:non_ski_review) { create(:non_ski_review) }

    let(:payload) do
      {
        data: {
          id: non_ski_review.id.to_s,
          type: 'non_ski_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NonSkiReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { non_ski_review.reload.updated_at }
      # .and change { non_ski_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:non_ski_review) { create(:non_ski_review) }

    let(:instance) do
      NonSkiReviewResource.find(id: non_ski_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { NonSkiReview.count }.by(-1)
    end
  end
end
