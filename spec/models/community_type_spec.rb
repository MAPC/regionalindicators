require 'spec_helper'

describe CommunityType do

  before { @community_type = CommunityType.new(name: "Something", abbr: "smthng") }

  subject { @community_type }
  
  it {should respond_to :name }
  it {should respond_to :abbr }

  describe "when name is blank" do
    before { @community_type.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @community_type.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @community_type.name = "a" * 70 }
    it { should_not be_valid }
  end

  describe "when abbr is blank" do
    before { @community_type.abbr = " " }
    it { should_not be_valid }
  end

  describe "when abbr is too short" do
    before { @community_type.abbr = "a" * 2}
    it { should_not be_valid }
  end

  describe "when abbr is too long" do
    before { @community_type.abbr = "a" * 70 }
    it { should_not be_valid }
  end

  describe "municipality associations" do

    before { @community_type.save }

    let!(:entry1) { @community_type.municipalities.create(name: "Quincy" )  }
    let!(:entry2) { @community_type.municipalities.create(name: "Milton" ) }

    describe "associates a muni to a community type" do
      it "should be equal to the community type id" do
        Municipality.find_by_name("Quincy").community_type_id == entry1.id
      end
    end

    describe "associates another muni to a community type" do
      it "should be equal to the community type id" do
        Municipality.find_by_name("Milton").community_type_id == entry2.id
      end
    end
  end

end
