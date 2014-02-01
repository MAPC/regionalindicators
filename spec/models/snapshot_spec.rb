require 'spec_helper'

describe Snapshot do
  it { should respond_to :date }
  it { should respond_to :rank }
  it { should respond_to :units }
  it { should respond_to :value }
end
