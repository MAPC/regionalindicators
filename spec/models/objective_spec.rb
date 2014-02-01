require 'spec_helper'

describe Objective do

  it { should respond_to :number }
  it { should respond_to :title }
  it { should respond_to :goal }
  it { should respond_to :indicators }

end
