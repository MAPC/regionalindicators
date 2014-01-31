require 'spec_helper'

describe Explanation do

  before do
    @explanation = Explanation.new(narrative: "# Accessible Construction\n+ bullet\n+ bullet")
  end


  subject { @explanation }

  it { should respond_to :narrative }
  it { should respond_to :narrative_html }
  # it { should respond_to :sources }
  # it { should respond_to :visualization }

  it "should render Markdown to HTML" do
    @explanation.narrative_html.should eq("<h1>Accessible Construction</h1>\n\n<ul>\n<li>bullet</li>\n<li>bullet</li>\n</ul>\n")
  end

end