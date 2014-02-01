require 'spec_helper'

describe Goal do
  
  it { should respond_to :number }
  it { should respond_to :slug }
  it { should respond_to :title }
  it { should respond_to :topic_area }
  it { should respond_to :objectives }
  
end
