require 'rails_helper'

describe "Show paper page", type: :feature do

  it "should render without error" do
    @paper = FactoryGirl.create :paper
    visit paper_path @paper
  end
end