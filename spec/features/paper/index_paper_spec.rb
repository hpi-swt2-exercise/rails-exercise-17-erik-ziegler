require 'rails_helper'

describe "Index paper page", type: :feature do

  it "should render without error" do
    visit papers_path
  end
end