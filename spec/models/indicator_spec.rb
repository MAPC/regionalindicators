require 'spec_helper'

# units = ["tons CO2", "%", "km^2"]

describe Indicator do

  before do
    @indicator = Indicator.new(title: 'Proportion of new construction accessible',
                               number: 87,
                               units: "people per square kilometer")
  end

  subject { @indicator }

  it { should be_valid }

  it { should respond_to :title }
  it { should respond_to :number }
  it { should respond_to :units }
  
  it { should respond_to :explanation }
  it { should respond_to :issue_areas }
  it { should respond_to :objective }
  it { should respond_to :snapshots }
  it { should respond_to :subject }
  it { should respond_to :slug }

  # it { should respond_to :projects }

  it { should respond_to :current_value }
  it { should respond_to :current_rank }
  it { should respond_to :value_in }
  it { should respond_to :rank_in }
  it { should respond_to :snapshot_since }
  it { should respond_to :value_delta }
  it { should respond_to :rank_delta }

  it { should respond_to :value }
  it { should respond_to :rank }

  it { should respond_to :threshhold }
  it { should respond_to :higher_value_is_better }
  it { should respond_to :lower_rank_is_better  }

  it { should respond_to :passing? }
  it { should respond_to :failing? }

  it { should respond_to :improving? }
  it { should respond_to :rank_improving? }

  it { should respond_to :stagnant? }
  it { should respond_to :rank_stagnant? }
  it { should respond_to :stagnant_rank? }

  it { should respond_to :trend }
  it { should respond_to :rank_trend }

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

    describe "current value" do
      it "gives the current snapshot's value" do
        @indicator.current_value.should == snap1.value
      end
    end

    describe "current rank" do
      it "gives the current snapshot's rank" do
        @indicator.current_rank.should == snap1.rank
      end
    end

    describe "past value" do
      it "gives the past snapshot's value" do
        @indicator.value_in(2000).should == snap2.value
      end
    end

    describe "past rank" do
      it "gives the past snapshot's rank" do
        @indicator.rank_in(2000).should == snap2.rank
      end
    end

    describe "with no rank, past value" do
      it "gives the past snapshot's value" do
        @indicator.value_in.should == snap2.value
      end
    end

    describe "with no rank, past rank" do
      it "gives the past snapshot's rank" do
        @indicator.rank_in.should == snap2.rank
      end
    end

    describe "#value_delta" do
      it "gives the difference in year values" do
        @indicator.value_delta(2000).should == 88
      end
    end

    describe "#rank_delta" do
      it "gives the difference in year ranks" do
        @indicator.rank_delta(2000).should == -13
      end
    end
  end

  describe "passing and failing values" do
    describe "with a threshhold" do

      before do
        @indicator.threshhold = 100
        @indicator.save
      end

      describe "with a normal orientation" do
        before { @indicator.snapshots.create(date: Time.now, rank: 1, value: 101) }
        
        it "passes and does not fail" do
          @indicator.passing?.should == true
          @indicator.failing?.should == false
        end
      end

      describe "with a reverse orientation" do
        before do
          @indicator.higher_value_is_better = false
          @indicator.snapshots.create(date: Time.now, rank: 1, value: 101)
        end
        
        it "fails and does not pass" do
          @indicator.passing?.should == false
          @indicator.failing?.should == true
        end
      end
    end

    describe "without a threshhold" do
      before do
        @indicator.threshhold = nil
        @indicator.save
      end
    end
  end


  describe "value and rank delta judgment" do

    before { @indicator.save }

    describe "with no snapshots" do

      describe "#passing" do
        it "returns nil" do
          @indicator.passing?.should == nil
        end
      end

      describe "#failing" do
        it "returns nil" do
          @indicator.failing?.should == nil
        end
      end

      describe "#improving?" do
        its(:improving?) { should == nil }
      end

      describe "#stagnant?" do
        its(:stagnant?) { should == nil }
      end

      describe "#rank_improving?" do
        its(:rank_improving?) { should == nil }
      end

      describe "#rank_stagnant?" do
        its(:rank_stagnant?) { should == nil }
      end

      describe "#trend" do
        its(:trend) { should == nil }
      end

      describe "#rank_trend" do
        its(:rank_trend) { should == nil }
      end

    end

    describe "with improving values" do

      let!(:snap) { @indicator.snapshots.create( date: Date.new(2000), rank: 2, value: 1 ) }
      let!(:pans) { @indicator.snapshots.create( date: Time.now,       rank: 1, value: 2 ) }

      describe "with a normal orientation" do

        describe "value delta" do
          it "is improving" do
            @indicator.improving?.should == true
          end

          it "has an improving trend" do
            @indicator.trend.should == :improving
          end
        end

        describe "rank delta" do
          it "is improving" do
            @indicator.rank_improving?.should == true
          end

          it "has an improving rank trend" do
            @indicator.rank_trend.should == :improving
          end
        end
      end

      describe "with a reverse orientation" do

        before do
          @indicator.update_attribute(:higher_value_is_better, false)
          @indicator.update_attribute(:lower_rank_is_better,   false)
        end

        describe "value delta" do
          it "is not improving" do
            @indicator.improving?.should == false
          end
          it "has a declining trend" do
            @indicator.trend.should == :declining
          end
        end

        describe "rank delta" do
          it "is not improving" do
            @indicator.rank_improving?.should == false
          end
          it "has a declining rank trend" do
            @indicator.rank_trend.should == :declining
          end
        end
      end
    end

    describe "with stagnant values" do

      let!(:snap) { @indicator.snapshots.create( date: Date.new(2000), rank: 1, value: 2 ) }
      let!(:pans) { @indicator.snapshots.create( date: Time.now,       rank: 1, value: 2 ) }

      describe "has stagnant" do

        its "value" do
          @indicator.stagnant?.should == true
        end

        its "rank" do
          @indicator.rank_stagnant?.should == true
        end
      end

      it "has a stagnant trend" do
        @indicator.trend.should == :stagnant
      end

      it "has a stagnant rank trend" do
        @indicator.rank_trend.should == :stagnant
      end

    end

  end






end