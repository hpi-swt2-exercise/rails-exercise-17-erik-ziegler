require 'rails_helper'

describe "Edit paper page", type: :feature do

  it "should render without error" do
    @paper = FactoryGirl.create :paper
    visit edit_paper_path @paper
  end

  it "should save changes" do
    @paper = FactoryGirl.create :paper
    visit edit_paper_path @paper

    fill_in "paper_title", :with => 'Another title'

    find('input[type="submit"]').click
  end

  it "should allow to select 5 authors from dropdowns" do
    @paper = FactoryGirl.create :paper
    visit edit_paper_path @paper

    expect(page).to have_content("Author 1")
    expect(page).to have_content("Author 2")
    expect(page).to have_content("Author 3")
    expect(page).to have_content("Author 4")
    expect(page).to have_content("Author 5")
  end

  it "should show only authors name in first select box" do
    @paper = FactoryGirl.create :paper
    @alan = FactoryGirl.create :author
    @paper.authors << @alan

    visit edit_paper_path @paper

    expect(page).to have_select("Author 1", selected: @alan.name)
  end
end