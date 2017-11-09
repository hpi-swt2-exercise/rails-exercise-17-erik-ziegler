require 'rails_helper'

describe "Edit author page", type: :feature do

  it "should render without error" do
    @alan = FactoryGirl.create :author
    visit edit_author_path @alan
  end
end