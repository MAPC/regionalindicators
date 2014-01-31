require 'spec_helper'

describe Indicator do

  before do
    @indicator = Indicator.new(title: 'Proportion of new construction accessible')
  end

  subject { @indicator }

  it { should respond_to :title }
  it { should respond_to :explanation }
  # it { should respond_to :benchmarks }
  # it { should respond_to :tags }
  # it { should respond_to :projects }

end