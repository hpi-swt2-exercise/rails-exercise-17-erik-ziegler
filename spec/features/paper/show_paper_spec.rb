require 'rails_helper'

describe "Show paper page", type: :feature do

  it "should render without error" do
    @paper = FactoryGirl.create :paper
    visit paper_path @paper
  end

  it "should show paper record" do
    @paper = FactoryGirl.create :paper
    visit paper_path @paper

    expect(page).to have_content(@paper.title)
    expect(page).to have_content(@paper.venue)
    expect(page).to have_content(@paper.year)
  end

  it "should list authors" do
    @paper = FactoryGirl.create :paper
    @author = FactoryGirl.create :author
    @paper.authors << @author

    visit paper_path @paper

    expect(page).to have_content(@author.name)
  end
end