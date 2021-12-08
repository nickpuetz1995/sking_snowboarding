require "rails_helper"

RSpec.describe SkiCheckInResource, type: :resource do
  describe "serialization" do
    let!(:ski_check_in) { create(:ski_check_in) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ski_check_in.id)
      expect(data.jsonapi_type).to eq("ski_check_ins")
    end
  end

  describe "filtering" do
    let!(:ski_check_in1) { create(:ski_check_in) }
    let!(:ski_check_in2) { create(:ski_check_in) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ski_check_in2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ski_check_in2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ski_check_in1) { create(:ski_check_in) }
      let!(:ski_check_in2) { create(:ski_check_in) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ski_check_in1.id,
                                      ski_check_in2.id,
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
                                      ski_check_in2.id,
                                      ski_check_in1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
