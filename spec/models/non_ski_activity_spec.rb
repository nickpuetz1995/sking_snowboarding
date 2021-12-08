require 'rails_helper'

RSpec.describe NonSkiActivity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:non_ski_reviews) }

    it { should belong_to(:tagged_ski_area) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
