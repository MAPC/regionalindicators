require 'spec_helper'

describe Subject do
  before do
    @subject = Subject.new(title: 'Proportion of new construction accessible')
  end

  subject { @subject }

  it { should respond_to :title }  
  it { should respond_to :explanation }

end
