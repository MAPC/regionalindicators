require 'spec_helper'

# units = ["tons CO2", "%", "km^2"]

describe Indicator do

  before do
    @indicator = Indicator.new(title: 'Proportion of new construction accessible')
  end

  subject { @indicator }

  it { should respond_to :title }
  
  it { should respond_to :snapshots }
  it { should respond_to :explanation }
  # it { should respond_to :projects }
  it { should respond_to :tags }

  # it { should respond_to :current_value }
  # it { should respond_to :earliest_value }
  # it { should respond_to :year_2000_or_earliest_value }
  # it { should respond_to :value_delta }
  # it { should respond_to :rank_delta }

end