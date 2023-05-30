require './spec/spec_helper'



RSpec.describe Gameplay do
  before(:each) do
    @game = Gameplay.new
  end
  
  it 'exists' do
    expect(@game).to be_a(Gameplay)
  end
end