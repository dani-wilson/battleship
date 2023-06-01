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
  #   @game.computer_get_coordinates
  #   expect(@game.computer_get_coordinates).to be_an(Array)
  # end

  it 'can place ships on the computer' do
    @game.computer_place_ship(@game.computer_cruiser)
    @game.computer_place_ship(@game.computer_sub)

    expect(@game.computer_board.render_board(true))
    # expect rendering to visually print 2 ships in valid coordinates
  end
end