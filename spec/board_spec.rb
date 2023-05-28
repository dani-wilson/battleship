require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has 16 cells' do
    expect(@board.cells.count).to eq(16)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells["A1"]).to be_a(Cell)
  end

  it 'can validate coordinates' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it 'should place the ship on same number of coordinates as its length' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
  end

  it 'will validate that coordinates are consecutive' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
  end




end