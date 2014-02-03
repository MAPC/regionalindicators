require 'spec_helper'

describe Goal do
  
  before { @goal = Goal.new(number: 1,
                            slug: 'operate-efficiently',
                            title: "Municipalities will operate efficiently and will have adequate funding with less reliance on the property tax .",
                            ) }

  subject { @goal }

  it { should respond_to :number }
  it { should respond_to :slug }
  it { should respond_to :title }
  it { should respond_to :topic_area }
  it { should respond_to :objectives }

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

  describe "when slug is not present" do
    before { @goal.slug = " " }
    it { should_not be_valid }
  end

  describe "when slug is too short" do
    before { @goal.slug = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when slug is too long" do
    before { @goal.slug = "a" * 31 }
    it { should_not be_valid }
  end
  
end
