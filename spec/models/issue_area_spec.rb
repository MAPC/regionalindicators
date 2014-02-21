require 'spec_helper'

describe IssueArea do
  
  before do
    @issue_area = IssueArea.new(  icon:      '&#xf007;', 
                                  title:     'Education Outcomes',
                                  datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=7"  )
  end

  subject { @issue_area }

  it { should be_valid }

  it { should respond_to :datacommon_url }
  it { should respond_to :icon }
  it { should respond_to :slug }
  it { should respond_to :css_class }
  it { should respond_to :title }
  it { should respond_to :sort_order }
  
  it { should respond_to :indicators }

  it { should be_valid }

  describe "when title is missing" do
    before { @issue_area.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @issue_area.title = "House" }
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

  describe "when link is missing" do
    before { @issue_area.datacommon_url = " " }
    it { should_not be_valid }
  end

  describe "when link does not include 'metrobostondatacommon.org'" do
    before { @issue_area.datacommon_url = "metroclaxondatacommon.net/data-sources/one-source.html"}
    it { should_not be_valid }
  end

  it "generates a slug from title" do
    @issue_area.slug.should == "education-outcomes"
  end

  describe "with a different title" do
    before { @issue_area.title = 'Civic Vitality & Governance' }
    it "generates a different slug" do
      @issue_area.slug.should == 'civic-vitality-governance'
    end
  end

  it "responds to 'css_class' with the slug" do
    @issue_area.css_class.should == @issue_area.slug
  end

  describe "when assigned to many indicators" do
    let!(:first_indicator) { Indicator.create(title: 'The CO2 Level', number: 87, units: "ppm") }
    let!(:other_indicator) { Indicator.create(title: 'Mercury Pollution', number: 87, units: "g/ml") }
    let!(:indicators) { [first_indicator, other_indicator] }

    before do
      indicators.each { |i| i.issue_areas << @issue_area }
      indicators.each { |i| i.save ; i.reload }
    end
    
    it "both retain the issue area" do
      first_indicator.issue_areas.first.should == @issue_area
      other_indicator.issue_areas.first.should == @issue_area
    end
  end

end