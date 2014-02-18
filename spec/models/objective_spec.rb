require 'spec_helper'

describe Objective do

  before { @objective = Objective.new(title: "Rates of recidivism will decrease.",
                                      number: 12) }

  subject { @objective }

  it { should be_valid }

  it { should respond_to :number }
  it { should respond_to :title }
  it { should respond_to :goal }
  it { should respond_to :indicators }
  it { should respond_to :full_number }

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

  describe "#full_number" do
    
    before { @objective.save }

    describe "when goal is not present" do
      it "should just return id" do
        @objective.full_number.should == @objective.id.to_s
      end
    end

    describe "when goal is present" do

      let!(:goal) { @objective.create_goal(number: 12,
                                      title: "Growth in town and village centers",
                                      description: "In suburban municipalities, most new growth will occur in town and village centers.")  } 

      it "should return goal.objective" do
        @objective.full_number.should == "#{@objective.goal.number}.#{@objective.number}"
      end
    end
  end
end
