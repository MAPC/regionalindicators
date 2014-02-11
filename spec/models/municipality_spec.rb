require 'spec_helper'

describe Municipality do

  before { @municipality = Municipality.new(name: "Inner Core") }

  subject { @municipality }
  
it { should respond_to :muni_id }
it { should respond_to :name }
it { should respond_to :community_type_id }
it { should respond_to :subregion_id }

  describe "when name is blank" do
    before { @municipality.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @municipality.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @municipality.name = "a" * 70 }
    it { should_not be_valid }
  end
end
