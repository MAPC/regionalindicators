require 'spec_helper'

describe Explanation do

  before do
    @explanation = Explanation.new(narrative: "# Accessible Construction\n+ bullet\n+ bullet")
  end


  subject { @explanation }

  it { should be_valid }

  it { should respond_to :narrative }
  it { should respond_to :narrative_html }
  it { should respond_to :sources }
  it { should respond_to :visualization }

  it "renders narrative Markdown to HTML" do
    @explanation.narrative_html.should eq("<h1>Accessible Construction</h1>\n\n<ul>\n<li>bullet</li>\n<li>bullet</li>\n</ul>\n")
  end

  describe "with no narrative" do
    before { @explanation.narrative = nil }
    it "returns an empty string" do
      @explanation.narrative_html.should eq("")
    end
  end

  describe "with an empty narrative" do
    before { @explanation.narrative = "" }
    it "returns an empty string" do
      @explanation.narrative_html.should == ""
    end
  end

  describe "when the narrative is too long" do
    before { @explanation.narrative = "a" * 1501 }
    it { should_not be_valid }
  end

end