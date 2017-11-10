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
    expect(page).to have_css("a", text: "Destroy")
  end

  it "should allow to filter by year" do
    paper1950 = Paper.create(title: 'Paper 1950', venue: 'Venue 1950', year: 1950)
    paper1968 = Paper.create(title: 'Paper 1968', venue: 'Venue 1968', year: 1968)

    visit papers_path year: 1950

    expect(page).to have_content(paper1950.title)
    expect(page).not_to have_content(paper1968.title)
  end
end