require 'spec_helper'

describe Municipality do

  before { @municipality = Municipality.new(name: "Inner Core") }

  subject { @municipality }
  
  it { should respond_to :muni_id }
  it { should respond_to :name }
  it { should respond_to :community_type_id }
  # it { should respond_to :subregion_id }
  # it { should respond_to :community_type }

  # it "should return the community type" do
  #   @municipality.community_type
  # end

  # it "should have one community type" do
  #   # @community_type = CommunityType.create(name: "Something" )
  #   municipality = Municipality.reflect_on_association(:community_types)
  #   municipality.macro.should == :has_one
  # end

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

  describe "when data is associated" do 
    before do
      @municipality = Municipality.create!(name: "Inner Core")
      @community_type = CommunityType.create!(name: "Inner City", abbr: "IC")
      @municipality.community_type = @community_type
      it "associates the records" do
        @municipality.community_type_id.should == @community_type.id
      end
    end  
  end
end
