require 'rails_helper'

describe "New paper page", type: :feature do

  it "should render without error" do
    visit new_paper_path
  end

  it "should have text input for title, venue, and year" do
    visit new_paper_path

    expect(page).to have_field('Title')
    expect(page).to have_field('Venue')
    expect(page).to have_field('Year')
  end

  it "should create correct instance" do
    visit new_paper_path

    fill_in "paper_title", :with => 'COMPUTING MACHINERY AND INTELLIGENCE'
    fill_in "paper_venue", :with => 'Mind 49: 433-460'
    fill_in "paper_year", :with => 1950

    find('input[type="submit"]').click

    paper = Paper.last
    expect(paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(paper.venue).to eq('Mind 49: 433-460')
    expect(paper.year).to eq(1950)
  end

  it "should show error when submitted and title is blank" do
    visit new_paper_path

    fill_in "paper_venue", :with => 'Mind 49: 433-460'
    fill_in "paper_year", :with => 1950

    find('input[type="submit"]').click

    expect(page).to have_content('Title can\'t be blank')
  end
end