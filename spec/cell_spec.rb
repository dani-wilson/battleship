require './spec/spec_helper'


RSpec.describe Cell do

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  it 'exists and has a coordinate' do
    expect(@cell.coordinate).to eq("B4")
  end

  it 'has no ship by default, so is an empty cell' do
    expect(@cell.ship).to eq(nil)
    expect(@cell.empty?).to eq(true)
  end

  it 'can have a ship placed into it' do
    @cell.place_ship(@cruiser)
    
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end
end