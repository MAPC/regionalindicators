require 'spec_helper'

describe Snapshot do

  before do 
    @snapshot = Snapshot.new( date: Time.now,
                              rank: 2,
                              value: 120  )
  end

  subject { @snapshot }

  it { should be_valid }

  it { should respond_to :date }
  it { should respond_to :rank }
  it { should respond_to :value }

  it { should_not respond_to :units }

  describe "when value is blank" do
    before { @snapshot.value = " " }
    it { should_not be_valid }
  end

  describe "when date is blank" do
    before { @snapshot.date = " " }
    it { should_not be_valid }
  end

  describe "when date is in an incorrect format" do
    before { @snapshot.date = "two weeks ago" }
    it { should_not be_valid }
  end

end
