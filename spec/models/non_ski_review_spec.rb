require "rails_helper"

RSpec.describe NonSkiReview, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:non_ski_activity) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:friends_sent) }
  end

  describe "Validations" do
  end
end
