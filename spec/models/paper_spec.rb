require 'rails_helper'

describe "Paper", :type => :model do
  let(:invalid_paper) {Paper.new(title: nil, venue: 'mind 49: 433-460', year: 1950)}

  it 'should be invalid' do
    expect(invalid_paper).to_not be_valid
  end
end