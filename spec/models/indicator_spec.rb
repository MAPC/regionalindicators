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

  it { should respond_to :current_snapshot }
  it { should respond_to :current_value }
  it { should respond_to :current_rank }
  it { should respond_to :snapshot_in }
  it { should respond_to :value_in }
  it { should respond_to :rank_in }
  it { should respond_to :snapshot_since }
  it { should respond_to :value_delta }
  it { should respond_to :rank_delta }

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

  describe "snapshots" do

    before { @indicator.save }

    let!(:snap2) { @indicator.snapshots.create(date: Date.new(2000),     rank: 14, value: 12)  }
    let!(:snap1) { @indicator.snapshots.create(date: Time.now,           rank: 1,  value: 100) }
    let!(:snap3) { @indicator.snapshots.create(date: Date.new(2005,5),   rank: 8,  value: 40)  }
    let!(:snap4) { @indicator.snapshots.create(date: Date.new(2009,1,4), rank: 3,  value: 80)  }

    it "returns the current_snapshot" do
      @indicator.current_snapshot.should == snap1
    end

    it "returns the snapshot in the year 2000" do
      @indicator.snapshot_in(2000).should == snap2
    end

    it "returns the snapshot in the year 2005" do
      @indicator.snapshot_in(2005).should == snap3
    end

    describe "current value" do
      it "gives the current snapshot's value" do
        @indicator.current_value.should == @indicator.current_snapshot.value
      end
    end

    describe "current rank" do
      it "gives the current snapshot's rank" do
        @indicator.current_rank.should == @indicator.current_snapshot.rank
      end
    end

    describe "past value" do
      it "gives the past snapshot's value" do
        @indicator.value_in(2000).should == @indicator.snapshot_in(2000).value
      end
    end

    describe "past rank" do
      it "gives the past snapshot's rank" do
        @indicator.rank_in(2000).should == @indicator.snapshot_in(2000).rank
      end
    end

    describe "with no rank, past value" do
      it "gives the past snapshot's value" do
        @indicator.value_in.should == @indicator.snapshot_in.value
      end
    end

    describe "with no rank, past rank" do
      it "gives the past snapshot's rank" do
        @indicator.rank_in.should == @indicator.snapshot_in.rank
      end
    end

    describe "value delta" do
      it "gives the difference in year values" do
        @indicator.value_delta(2000).should == 88
      end
    end

    describe "rank delta" do
      it "gives the difference in year ranks" do
        @indicator.rank_delta(2000).should == 13
      end
    end
  end

  describe "snapshots in the same year" do

    before { @indicator.save }
    let!(:snap2) { @indicator.snapshots.create(date: Date.new(2000,5), rank: 2,  value: 100) }
    let!(:snap1) { @indicator.snapshots.create(date: Date.new(2000,6), rank: 1,  value: 10) }
    
    
    it "returns the most recent snapshot in the year" do
      @indicator.snapshot_in(2000).should == snap1
    end
  end


end