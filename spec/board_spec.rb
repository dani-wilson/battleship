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
  end


end