require 'spec_helper'

describe "Report pages" do

  subject { page }

  describe "homepage" do

    describe "with featured reports" do

      describe "one featured and one not" do
        let!(:featured) { TopicArea.create(title: "Prosperity",
                                       subtitle: "What makes a prosperous region?",
                                       featured: true) }

        let!(:not_featured) { TopicArea.create(title: "Sustainable Growth Patterns",
                                       subtitle: "What makes a sustainable region?",
                                       visible: true,
                                       featured: false) }
        before { visit root_path }
        it { should have_content('MAPC Regional Indicators') }
        it { should have_selector('h1', text: 'Prosperity') ; save_and_open_page }
        it { should have_selector('h3', text: not_featured.title ) }
      end

      describe "two featured" do
        let!(:featured) { TopicArea.create(title: "Prosperity",
                                       subtitle: "What makes a prosperous region?",
                                       featured: true) }

        let!(:featured2) { TopicArea.create(title: "Sustainable Growth Patterns",
                                       subtitle: "What makes a sustainable region?",
                                       featured: true) }
        before { visit root_path }
        it { should have_selector('h1', text: 'Prosperity') }
        it { should have_selector('h1', text: featured2.title ) }
      end
    end

    pending "without featured reports" do
      let!(:not_featured) { TopicArea.create(title: "Prosperity",
                                     subtitle: "What makes a prosperous region?",
                                     featured: false) }

      let!(:not_featured2) { TopicArea.create(title: "Sustainable Growth Patterns",
                                     subtitle: "What makes a sustainable region?",
                                     featured: false) }
      before { visit root_path }
      it { should have_selector('h1', text: not_featured.title ) }
      it { should have_selector('h3', text: not_featured2.title ) }
    end

  end

end
