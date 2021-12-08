require 'rails_helper'

RSpec.describe SkiAreaReviewResource, type: :resource do
  describe 'serialization' do
    let!(:ski_area_review) { create(:ski_area_review) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ski_area_review.id)
      expect(data.jsonapi_type).to eq('ski_area_reviews')
    end
  end

  describe 'filtering' do
    let!(:ski_area_review1) { create(:ski_area_review) }
    let!(:ski_area_review2) { create(:ski_area_review) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: ski_area_review2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([ski_area_review2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:ski_area_review1) { create(:ski_area_review) }
      let!(:ski_area_review2) { create(:ski_area_review) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            ski_area_review1.id,
            ski_area_review2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            ski_area_review2.id,
            ski_area_review1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
