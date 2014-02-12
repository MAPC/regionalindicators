require 'spec_helper'

describe Project do

  before { @project = Project.new(name: "TOD") }

  subject { @project }
  
  it {should respond_to :name }

  describe "when name is blank" do
    before { @project.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @project.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @project.name = "a" * 170 }
    it { should_not be_valid }
  end
end
