require 'spec_helper'

describe Objective do

  before { @objective = Objective.new(number: 1, title: "Rates of recidivism will decrease.") }

  subject { @objective }

  it { should respond_to :number }
  it { should respond_to :title }
  it { should respond_to :goal }
  it { should respond_to :indicators }

  describe "when title is not present" do
    before { @objective.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @objective.title = "a" *  256 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @objective.title = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when number is not present" do
    before { @objective.number = " " }
    it { should_not be_valid }
  end

end
