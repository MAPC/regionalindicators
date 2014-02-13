require 'spec_helper'

describe Department do

  before { @department = Department.new(name: "FDA") }

  subject { @department }
  
it {should respond_to :name }

  describe "when name is blank" do
    before { @department.name = " " }
    it { should_not be_valid }
  end

 describe "when title is too short" do
    before { @department.name = "a" * 2 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @department.name = "a" * 70 }
    it { should_not be_valid }
  end

end
