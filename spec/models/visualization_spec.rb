require 'spec_helper'

describe Visualization do

  before { @visualization = Visualization.new(title: "A Map") }

  subject { @visualization }

  it { should respond_to :data }
  it { should respond_to :d3 }
  it { should respond_to :slug }

  it { should be_valid }
  
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

end
