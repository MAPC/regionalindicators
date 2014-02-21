require 'spec_helper'

describe Subject do
  before do
    @subject = Subject.new(title: 'A Diverse and Productive Workforce')
  end

  subject { @subject }

  it { should be_valid }

  it { should respond_to :title }  
  it { should respond_to :explanation }
  it { should respond_to :slug }
  it { should respond_to :indicators }

  describe "when title is not present" do
    before { @subject.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @subject.title = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @subject.title = "a" * 7 }
    it { should_not be_valid }
  end

  it "generates a slug from title" do
    @subject.slug.should == 'a-diverse-and-productive-workforce'
  end

  describe "with a different title" do
    before { @subject.title = 'Corporate Civic Engagement' }
    it "generates a different slug" do
      @subject.slug.should == 'corporate-civic-engagement'
    end
  end


end
