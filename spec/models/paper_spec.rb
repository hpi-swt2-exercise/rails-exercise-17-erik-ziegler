require 'rails_helper'

describe "Paper", :type => :model do
  let(:paper_without_title) {Paper.new(title: nil, venue: 'mind 49: 433-460', year: 1950)}
  let(:paper_without_venue) {Paper.new(title: 'computing machinery and intelligence', venue: nil, year: 1950)}

  it "should be invalid without title" do
    expect(paper_without_title).to_not be_valid
  end

  it "should be invalid without venue" do
    expect(paper_without_venue).to_not be_valid
  end
end