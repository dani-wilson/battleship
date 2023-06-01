require './spec/spec_helper'



RSpec.describe Gameplay do
  before(:each) do
    @game = Gameplay.new
  end

  it 'exists' do
    expect(@game).to be_a(Gameplay)
  end

  it 'creates boards and ships for user and computer players upon initialization' do
    expect(@game.user_board).to be_a(Board)
    expect(@game.computer_board).to be_a(Board)
    expect(@game.user_cruiser).to be_a(Ship)
    expect(@game.user_sub).to be_a(Ship)
    expect(@game.computer_cruiser).to be_a(Ship)
    expect(@game.computer_sub).to be_a(Ship)
  end
end
