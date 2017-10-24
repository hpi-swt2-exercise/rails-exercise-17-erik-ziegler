require 'rails_helper'

describe "Show author page" do

  it "should render without errors" do
    @alan = FactoryGirl.create :author
    visit author_path @alan
  end

  it "should show author record" do
    @alan = FactoryGirl.create :author
    visit author_path @alan

    expect(page).to have_content(@alan.first_name)
  end
end