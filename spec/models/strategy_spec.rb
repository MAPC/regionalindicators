require 'spec_helper'

describe Strategy do

  before { @strategy = Strategy.new(name: "Inner Core", number: 3) }

  subject { @strategy }
  
  it {should respond_to :name }
  it {should respond_to :number }

  describe "when name is blank" do
    before { @strategy.name = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @strategy.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @strategy.name = "a" * 150 }
    it { should_not be_valid }
  end

  describe "when number is blank" do
    before { @strategy.number = " " }
    it { should_not be_valid }
  end
end
