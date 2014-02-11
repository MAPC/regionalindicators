require 'spec_helper'

describe Goal do
  
  before { @goal = Goal.new(number: 1,
                            description: "Municipalities will operate efficiently and will have adequate funding with less reliance on the property tax.",
                            title: "Efficient, well-funded municipalities"
                            ) }

  subject { @goal }

  it { should respond_to :description }
  it { should respond_to :number }
  it { should respond_to :slug }
  it { should respond_to :title }
  it { should respond_to :topic_area }
  it { should respond_to :objectives }
  it { should respond_to :indicators }

  describe "when title is not present" do
    before { @goal.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @goal.title = "a" * 256 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @goal.title = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when number is not present" do
    before { @goal.number = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @goal.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @goal.description = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @goal.description = "a" * 256 }
    it { should_not be_valid }
  end

  it "generates a slug from title" do
    @goal.slug.should == 'efficient-well-funded-municipalities'
  end

  describe "with a different title" do
    before { @goal.title = 'Less regional segregation' }
    it "generates a different slug" do
      @goal.slug.should == 'less-regional-segregation'
    end
  end
  
end
