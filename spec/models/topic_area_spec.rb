require 'spec_helper'

describe TopicArea do

  it { should respond_to :abbr }
  it { should respond_to :title }
  it { should respond_to :subtitle }
  it { should respond_to :goals }
  it { should respond_to :subjects }
  
end
