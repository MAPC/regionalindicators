require 'spec_helper'

describe Visualization do

  before { @visualization = Visualization.new(title: "A Map",
                                              url: "http://metrobostondatacommon.org/visualizations/2296/DebtToDegreeMap.jpg"
                            ) }

  subject { @visualization }

  it { should respond_to :title }
  it { should respond_to :url }

  describe "when title is blank" do
    before { @visualization.title = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @visualization.title = "a" * 3 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @visualization.title = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when url is blank" do
    before { @visualization.url = " " }
    it { should_not be_valid }
  end

  describe "when url is correct" do
    before { @visualization.url = "http://metrobostondatacommon.org/visualizations/2296/DebtToDegreeMap.jpg" }
    it { should be_valid }  
  end
end
