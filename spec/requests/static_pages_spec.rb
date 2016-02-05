require 'spec_helper'

describe "Static pages" do
    
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end
   
  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Welcome' }
    let(:page_title) { '' }
  
    it_should_behave_like "all static pages"
    it { should have_title('Home') }    
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help page' }
    let(:page_title) { '' }
  
    it_should_behave_like "all static pages"
    it { should have_title('Help') }    
  end

  describe "About Us" do
    before { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { '' }
  
    it_should_behave_like "all static pages"
    it { should have_title('About Us') }    
  end
   
  
  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact page' }
    let(:page_title) { '' }
  
    it_should_behave_like "all static pages"
    it { should have_title('Contact') }    
  end


  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    expect(page).to have_title(full_title('Home'))
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    #click_link "eSNET..."
    #expect(page).to have_title(full_title('Home'))
  end

end

