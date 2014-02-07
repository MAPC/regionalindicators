require 'spec_helper'

describe TopicArea do

  before { @topic_area = TopicArea.new(title: "Sustainable Growth Patterns") }

  subject { @topic_area }

  it { should respond_to :abbr }
  it { should respond_to :explanation }
  it { should respond_to :title }
  it { should respond_to :subtitle }
  it { should respond_to :goals }
  it { should respond_to :subjects }
  it { should respond_to :slug }
  it { should respond_to :visible }
  it { should respond_to :visible? }
  it { should respond_to :featured }
  it { should respond_to :featured? }

  describe "when title is not present" do
    before { @topic_area.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @topic_area.title = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @topic_area.title = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when subtitle is not present" do
    before { @topic_area.subtitle = " " }
    it { should be_valid }
  end

  describe "when subtitle is too long" do
    before { @topic_area.subtitle = "a" * 141 }
    it { should_not be_valid }
  end

  describe "when subtitle is too short" do
    before { @topic_area.subtitle = "a" * 7 }
    it { should_not be_valid }
  end

  it "generates a slug from title" do
    @topic_area.slug.should == 'sustainable-growth-patterns'
  end

  describe "with a different title" do
    before { @topic_area.title = 'Corporate Civic Engagement' }
    it "generates a different slug" do
      @topic_area.slug.should == 'corporate-civic-engagement'
    end
  end

  describe "if featured but not visible" do
    before do 
      @topic_area.featured = true
      @topic_area.visible  = false
      @topic_area.save
    end
    it "should set visible to true before saving" do
      @topic_area.visible.should == true
    end
  end

  describe "if not featured and not visible" do
    before do 
      @topic_area.featured = false
      @topic_area.visible  = false
      @topic_area.save
    end
    it "should set visible to true before saving" do
      @topic_area.visible.should == false
    end
  end

  describe "when 3 are featured" do
    let!(:ta1) { TopicArea.create(title: "A Placeholder Title", featured: true) }
    let!(:ta2) { TopicArea.create(title: "A Placeholder Title", featured: true) }
    let!(:ta3) { TopicArea.create(title: "A Placeholder Title", featured: true) }
    
    before { @topic_area.featured = true }
    it { should_not be_valid }
  end





end