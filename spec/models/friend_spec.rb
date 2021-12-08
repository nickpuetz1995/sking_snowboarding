require "rails_helper"

RSpec.describe Friend, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:friend_recipient) }

    it { should belong_to(:friend_sender) }
  end

  describe "InDirect Associations" do
    it { should have_one(:ski_check_in) }

    it { should have_one(:non_ski_review) }

    it { should have_one(:ski_area_review) }
  end

  describe "Validations" do
  end
end
