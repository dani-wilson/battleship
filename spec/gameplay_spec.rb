require './spec/spec_helper'



RSpec.describe Gameplay do
  before(:each) do
    @game = Gameplay.new
  end

  it 'exists' do
    expect(@game).to be_a(Gameplay)
  end

  # it 'has a welcome message' do
  #   expect(@game.message).to eq("Welcome to BATTLESHIP
  #   Enter p to play. Enter q to quit.")
  # end

  # it 'offers option to start or quit game' do
  #   expect(@game.start_or_quit).to eq(@game.message)
  # end

  # it 'allows user to play' do
  #   expect(@game.begin_game).to eq("p")
  # end

  # it 'test' do
  #   @game.user_turn
  # end

  # it 'test' do
  #   @game.computer_get_coordinates
  #   expect(@game.computer_get_coordinates).to be_an(Array)
  # end

  it 'test' do
    @game.computer_place_ships
    expect(@game.computer_board.render_board(true).count("S")).to eq(5)
    # binding.pry
  end
end