require 'spec_helper'

describe IndicatorGroup do

  before do
    @group = IndicatorGroup.new(title: "College attainment gap")
  end

  subject { @group }

  it { should be_valid }

  it { should respond_to :title }
  it { should respond_to :indicators }

  it { should respond_to :first }
  it { should respond_to :last  }

  it { should respond_to :slug }

  describe "with indicators" do
    
    let(:last)  { stub_model(Indicator, id: 10) }
    let(:first) { stub_model(Indicator, id: 1)  }
    let(:mid)   { stub_model(Indicator, id: 5)  }

    before do
      @group.indicators << mid
      @group.indicators << last
      @group.indicators << first
    end

    it "has indicators" do
      @group.indicators.length.should == 3
    end

    it "has the right first indicator" do
      @group.first.should == first
    end

    it "has the right last indicator" do
      @group.last.should == last
    end
  end

  describe "#title" do
    context "without a title" do
      before { @group.title = " " }
      it { should_not be_valid }
    end

    context "with a nil title" do
      before { @group.title = nil }
      it { should_not be_valid }
    end
  end

end