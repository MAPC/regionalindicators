require 'spec_helper'

# units = ["tons CO2", "%", "km^2"]

describe Indicator do

  before do
    @indicator = Indicator.new(title: 'Proportion of new construction accessible',
                               number: 87,
                               units: "people per square kilometer")
  end

  subject { @indicator }

  it { should respond_to :title }
  it { should respond_to :number }
  it { should respond_to :units }
  
  it { should respond_to :explanation }
  it { should respond_to :issue_areas }
  it { should respond_to :objective }
  it { should respond_to :snapshots }

  # it { should respond_to :projects }

  it { should respond_to :current_value }
  it { should respond_to :value_in_2000_at_earliest }
  it { should respond_to :value_delta }

  describe "when title is not present" do
    before { @indicator.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @indicator.title = "a" * 161 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @indicator.title = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when number is not present" do
    before { @indicator.number = " " }
    it { should_not be_valid }
  end

  describe "when units is not present" do
    before { @indicator.units = " " }
    it { should_not be_valid }
  end

  describe "when units is too long" do
    before { @indicator.units = "a" * 141 }
    it { should_not be_valid }
  end

end