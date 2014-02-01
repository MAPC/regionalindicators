require 'spec_helper'

# units = ["tons CO2", "%", "km^2"]

describe Indicator do

  before do
    @indicator = Indicator.new(title: 'Proportion of new construction accessible')
  end

  subject { @indicator }

  it { should respond_to :title }
  it { should respond_to :number }
  
  it { should respond_to :explanation }
  it { should respond_to :issue_areas }
  it { should respond_to :objective }
  it { should respond_to :snapshots }

  # it { should respond_to :projects }

  it { should respond_to :current_value }
  it { should respond_to :earliest_value }
  it { should respond_to :value_in }
  it { should respond_to :rank_in }
  it { should respond_to :value_in_2000_at_earliest }
  it { should respond_to :value_delta }
  it { should respond_to :rank_delta }

end