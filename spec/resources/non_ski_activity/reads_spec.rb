require "rails_helper"

RSpec.describe NonSkiActivityResource, type: :resource do
  describe "serialization" do
    let!(:non_ski_activity) { create(:non_ski_activity) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(non_ski_activity.id)
      expect(data.jsonapi_type).to eq("non_ski_activities")
    end
  end

  describe "filtering" do
    let!(:non_ski_activity1) { create(:non_ski_activity) }
    let!(:non_ski_activity2) { create(:non_ski_activity) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: non_ski_activity2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([non_ski_activity2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:non_ski_activity1) { create(:non_ski_activity) }
      let!(:non_ski_activity2) { create(:non_ski_activity) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      non_ski_activity1.id,
                                      non_ski_activity2.id,
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
                                      non_ski_activity2.id,
                                      non_ski_activity1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
