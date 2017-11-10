require 'rails_helper'

describe "Index paper page", type: :feature do

  it "should render without error" do
    visit papers_path
  end

  it "should show paper record" do
    @paper = FactoryGirl.create :paper

    visit papers_path

    expect(page).to have_content(@paper.title)
    expect(page).to have_content(@paper.venue)
    expect(page).to have_content(@paper.year)
  end

  it "should have add paper link" do
    visit papers_path

    expect(page).to have_css("a", text: "Add paper")
  end

  it "should have show and edit link" do
    FactoryGirl.create :paper

    visit papers_path

    expect(page).to have_css("a", text: "Show")
    expect(page).to have_css("a", text: "Edit")
  end
end