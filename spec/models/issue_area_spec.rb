require 'spec_helper'

describe IssueArea do
  
  before do
    @issue_area = IssueArea.new(  css_class: 'education-outcomes',
                                  icon:      '&#xf007;', 
                                  slug:      'education-outcomes',
                                  title:     'Education Outcomes'  )
  end

  subject { @issue_area }

  it { should respond_to :datacommon_url }
  it { should respond_to :icon }
  it { should respond_to :slug }
  it { should respond_to :title }
  
  it { should respond_to :taggable }
  # it { should respond_to :indicators }

  describe "when title is missing" do
    before { @issue_area.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @issue_area.title = "LOL" }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @issue_area.title = "Civic Vitality & Governance & Voting & Friends" }
    it { should_not be_valid }
  end

  describe "when icon is missing" do
    before { @issue_area.icon = " " }
    it { should_not be_valid }
  end

  describe "when slug is not present" do
    before { @issue_area.slug = " " }
    it { should_not be_valid }
  end

  describe "when slug is too short" do
    before { @issue_area.slug = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when slug is too long" do
    before { @issue_area.slug = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when link is missing" do
    before { @issue_area.datacommon_url = " " }
    it { should_not be_valid }
  end

  describe "when link does not include 'metrobostondatacommon.org'" do
    before { @issue_area.datacommon_url = "metroclaxondatacommon.net/data-sources/one-source.html"}
    it { should_not be_valid }
  end

end