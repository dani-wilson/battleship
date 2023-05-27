require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @board = Board.new
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


end