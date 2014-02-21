require 'spec_helper'

describe "StaticPages" do

  subject { page }

  let!(:about)     { FactoryGirl.create(:static_page, title: 'About') }
  let!(:contact)   { FactoryGirl.create(:static_page, title: 'Contact', sort_order: 2) }
  let!(:dashboard) { FactoryGirl.create(:static_page, title: 'Dashboard', sort_order: 3, top: false) }

  let!(:featured)  { FactoryGirl.create(:topic_area, title: 'Prosperity',  featured: true) }
  let!(:visible)   { FactoryGirl.create(:topic_area, title: 'Sustainable', featured: false) }
  let!(:invisible) { FactoryGirl.create(:topic_area, title: 'State of Equity',      visible: false) }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Regional Indicators') }

    describe "nav bar" do
      it { should have_selector('li', text: 'Topical Reports') }

      it { should have_selector('li', text: featured.title) }
      it { should have_selector('li', text: visible.title) }
      it { should_not have_selector('li', text: invisible.title) }

      it { should have_selector('li', text: about.title) }
      it { should have_selector('li', text: contact.title ) }
      it { should_not have_selector('li', text: dashboard.title) }
    end
  end

  describe "About page" do
    before { visit '/about' }
    it { should have_content( about.title ) }
  end

  describe "Contact page" do
    before { visit '/contact' }
    it { should have_content( contact.title ) }
  end

  describe "Dashboard page" do
    before { visit '/dashboard' }
    it { should have_content( dashboard.title ) }
  end
end
