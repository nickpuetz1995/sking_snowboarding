require "rails_helper"

RSpec.describe SkiAreaResource, type: :resource do
  describe "serialization" do
    let!(:ski_area) { create(:ski_area) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ski_area.id)
      expect(data.jsonapi_type).to eq("ski_areas")
    end
  end

  describe "filtering" do
    let!(:ski_area1) { create(:ski_area) }
    let!(:ski_area2) { create(:ski_area) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ski_area2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ski_area2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ski_area1) { create(:ski_area) }
      let!(:ski_area2) { create(:ski_area) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ski_area1.id,
                                      ski_area2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ski_area2.id,
                                      ski_area1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
