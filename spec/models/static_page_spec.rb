require 'spec_helper'

describe StaticPage do
  
  before { @page = StaticPage.new(title: "About",
                                  content: "This is the _about_ page!",
                                  top: false,
                                  sort_order: 1) }

  subject { @page }

  it { should respond_to :content }
  it { should respond_to :slug_id }
  it { should respond_to :sort_order }
  it { should respond_to :title }
  it { should respond_to :top }

  it { should be_valid }

  describe "without a sort order" do
    before { @page.sort_order = nil }
    it { should be_valid }
  end

  describe "without a title" do
    before { @page.title = ' ' }
    it { should_not be_valid }
  end

  describe "without content" do
    before { @page.content = ' ' }
    it { should_not be_valid }
  end

  describe "with a weird title" do
    before { @page.title = "What! & A Weird Title?"}

    it "should have the right slug" do
      @page.slug.should == "what-a-weird-title"
    end
  end

  describe "when saving" do
    before { @page.save }

    it "should have a slug_id" do
      @page.slug_id.should_not == nil
    end

    it "should have the right slug_id" do
      @page.slug_id.should == "about"
    end

    it "should be the same as the slug" do
      @page.slug_id.should == @page.slug
    end
  end

end
