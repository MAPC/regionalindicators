require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the content 'Regional Indicators'" do
      visit root_path
      page.should have_content('Regional Indicators')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit about_path
      page.should have_content('About')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit contact_path
      page.should have_content('Contact')
    end
  end

  describe "Dashboard page" do
    it "should have the content 'Indicators Dashboard'" do
      visit dashboard_path
      page.should have_content('Indicators Dashboard')
    end
  end

end
