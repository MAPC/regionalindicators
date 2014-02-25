require 'spec_helper'

describe "Report pages" do

  subject { page }

  describe "homepage" do

    describe "with featured reports" do

      describe "one featured and one not" do

        let!(:featured)     { FactoryGirl.create(:topic_area, title: "Prosperity", featured: true) }
        let!(:not_featured) { FactoryGirl.create(:topic_area, featured: false) }

        before { visit root_path }
        it { should have_content('MAPC Regional Indicators') }
        it { should have_selector('h1', text: 'Prosperity') }
        it { should have_selector('h3', text: not_featured.title ) }
      end

      describe "two featured" do
        let!(:featured) { FactoryGirl.create(:topic_area, title: "Prosperity",
                                              subtitle: "What makes a prosperous region?",
                                              featured: true) }
        let!(:featured2) { FactoryGirl.create(:topic_area, featured: true) }

        before { visit root_path }

        it { should have_selector('h1', text: 'Prosperity') }
        it { should have_selector('h1', text: featured2.title ) }

        it { should have_selector('li', text: featured.title ) }
        it { should have_selector('li', text: featured2.title ) }
      end
    end

    describe "without featured reports" do
      let!(:not_featured)  { FactoryGirl.create(:topic_area) }
      let!(:not_featured2) { FactoryGirl.create(:topic_area, title: "Prosperity") }
      let!(:not_visible)   { FactoryGirl.create(:topic_area, title: "State of Equity", visible: false) }

      before { visit root_path }
      
      it { should have_selector('h1', text: not_featured.title ) }
      it { should have_selector('h3', text: not_featured2.title ) }
      it { should_not have_content( not_visible.title ) }
    end

  end

end
