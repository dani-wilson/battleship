require './spec/spec_helper'


RSpec.describe Cell do

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  it 'exists and has a coordinate' do
    expect(@cell.coordinate).to eq("B4")
  end
end