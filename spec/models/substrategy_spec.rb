require 'spec_helper'

describe Substrategy do

  before { @substrategy = Substrategy.new(name: "TOD", abbr: "T") }

  subject { @substrategy }
  
  it {should respond_to :name }
  it {should respond_to :abbr }

  describe "when name is blank" do
    before { @substrategy.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @substrategy.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @substrategy.name = "a" * 170 }
    it { should_not be_valid }
  end

  describe "when letter is blank" do
    before { @substrategy.abbr = " " }
    it { should_not be_valid }
  end

  describe "when letter is too long" do
    before { @substrategy.abbr = "a" * 2 }
    it { should_not be_valid }
  end
end
