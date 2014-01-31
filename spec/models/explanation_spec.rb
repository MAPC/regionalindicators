require 'spec_helper'

describe Explanation do

  subject { @explanation }

  it { should respond_to :narrative }
  it { should respond_to :narrative_html }
  it { should respond_to :sources }
  it { should respond_to :visualization }

end