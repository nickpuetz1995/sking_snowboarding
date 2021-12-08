require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ski_check_ins) }

    it { should have_many(:friends_received) }

    it { should have_many(:friends_sent) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
