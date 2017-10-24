require 'rails_helper'

describe "New author page", type: :feature do

  it "should render without error" do
    visit new_author_path
  end

  it "should have text input for first name, last name, and homepage" do
    visit new_author_path

    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
  end

  it "should persist to database" do
    visit new_author_path

    fill_in "author_first_name", :with => 'Alan'
    fill_in "author_last_name", :with => 'Turing'
    fill_in "author_homepage", :with => 'http://wikipedia.org/Alan_Turing'

    find('input[type="submit"]').click

    author = Author.last
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end
end