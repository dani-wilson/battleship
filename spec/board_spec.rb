require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end
end