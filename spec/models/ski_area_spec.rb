require 'rails_helper'

RSpec.describe SkiArea, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ski_check_ins) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
