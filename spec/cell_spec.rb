require './spec/spec_helper'

RSpec.describe Cell do

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  it 'exists and has a coordinate' do
    expect(@cell_1).to be_a(Cell)
    expect(@cell_1.coordinate).to eq("B4")
  end

  it 'has no ship by default, so is an empty cell' do
    expect(@cell_1.ship).to eq(nil)
    expect(@cell_1.empty?).to eq(true)
  end

  it 'can have a ship placed into it' do
    @cell_1.place_ship(@cruiser)
    
    expect(@cell_1.ship).to eq(@cruiser)
    expect(@cell_1.empty?).to eq(false)
  end

  it 'can be fired upon and lose health if so' do
    @cell_1.place_ship(@cruiser)
    expect(@cell_1.fired_upon?).to eq(false)

    @cell_1.fire_upon

    expect(@cell_1.ship.health).to eq(2)
    expect(@cell_1.fired_upon?).to eq(true)
  end

  it "can render a String representation of itself" do
    expect(@cell_1.render).to eq(".")

    @cell_1.fire_upon

    expect(@cell_1.render).to eq("M")
  end

  it 'can indicate a ship as present even if not fired upon' do
    @cell_2.place_ship(@cruiser)
    
    expect(@cell_2.render).to eq(".")

    expect(@cell_2.render(true)).to eq("S")
  end

  it 'will show that its been hit' do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    
    expect(@cell_2.render).to eq("H")
    expect(@cruiser.sunk?).to eq(false)
  end
  
  it 'will get sunk and render as such' do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    @cruiser.hit
    @cruiser.hit

    expect(@cruiser.sunk?).to eq(true)
    expect(@cell_2.render).to eq("X")
  end
end