require 'spec_helper'

describe Subregion do

  before { @subregion = Subregion.new(name: "Inner Core", abbr: "IC") }

  subject { @subregion }
  
  it {should respond_to :name }
  it {should respond_to :abbr }

  describe "when name is blank" do
    before { @subregion.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @subregion.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @subregion.name = "a" * 70 }
    it { should_not be_valid }
  end

  describe "when abbr is blank" do
    before { @subregion.abbr = " " }
    it { should_not be_valid }
  end

  describe "when abbr is too short" do
    before { @subregion.abbr = "a" * 1}
    it { should_not be_valid }
  end

  describe "when abbr is too long" do
    before { @subregion.abbr = "a" * 70 }
    it { should_not be_valid }
  end

  describe "when .by_name_asc is called" do
    let!(:subregion_one) { Subregion.create(name: "Streetcar Communities", abbr: "SC") }
    let!(:subregion_two) { Subregion.create(name: "Metropolitan Core Communities", abbr: "MCC" ) }

    it "orders by ascending name" do
      Subregion.by_name_asc.should eq [subregion_two, subregion_one]
    end
  end


end
