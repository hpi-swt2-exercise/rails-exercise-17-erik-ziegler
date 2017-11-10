require 'rails_helper'

describe "Index author page", type: :feature do

  it "should render without error" do
    visit authors_path
  end

  it "should show authors name" do
    @alan = FactoryGirl.create :author

    visit authors_path

    expect(page).to have_content(@alan.name)
  end

  it "should have add_author_link" do
    visit authors_path
    expect(page).to have_css("a", text: "Add author")
  end

  it "should have edit author link" do
    FactoryGirl.create :author
    
    visit authors_path

    expect(page).to have_css("a", text: "Edit")
  end

  it "should have show link" do
    FactoryGirl.create :author

    visit authors_path

    expect(page).to have_css("a", text: "Show")
  end
end