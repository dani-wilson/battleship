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

  it 'will not allow diagonal placements' do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
  end

  it 'also has valid placements' do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'has conditions which will cause placements to fail' do
    expect(@board.valid_placement?(@submarine, ["A1, A2, A3, A3"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A5, B5"])).to eq(false)

    @board.place(@cruiser, ["A3, B3", "C3"])

    expect(@board.valid_placement?(@submarine, ["B2", "B3"])).to eq(false)
  end

  it 'can have a ship placed in its cells' do
    expect(@board.place(@cruiser, ["A1", "A2", "A3"])).to eq(["A1", "A2", "A3"])
    expect(@board.cells["A1"].ship).to be_a(Ship)
    expect(@board.cells["A2"].ship).to be_a(Ship)
    expect(@board.cells["A3"].ship).to be_a(Ship)
    expect(@board.cells["A4"].empty?).to eq(true)
    expect(@board.cells["A2"].ship == @board.cells["A3"].ship).to eq(true)
  end

  it 'cannot allow for overlapping ships' do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    expect(@board.place(@submarine, ["A1, B1"])).to eq(nil)
  end

  it 'can split the coordinates into letters(ordinal values) and numbers' do
    expect(@board.split_coordinates(["A1"])).to eq([[65], [1]])
  end

  it 'can render itself in string format' do
    @board.place(@cruiser, ["A3", "B3", "C3"])
    @board.render_board(true)
  end

  it 'will show ships' do
    @board.place(@cruiser, ["A3", "B3", "C3"])
    @board.render_board(true)
    expect(@board.cells["A3"].ship).to be_a(Ship)
  end

  it 'can render hits and misses' do
    @board.place(@cruiser, ["A3", "B3", "C3"])
    @board.render_board(true)
    expect(@board.cells["A3"].ship).to be_a(Ship)

    @board.cells["A1"].fire_upon

    expect(@board.cells["A1"].render).to eq("M")
    
    @board.cells["B3"].fire_upon

    expect(@board.cells["B3"].render).to eq("H")
  end
end