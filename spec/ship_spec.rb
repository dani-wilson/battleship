require './spec/spec_helper'

RSpec.describe Ship do
    before(:each) do 
        @cruiser = Ship.new("Cruiser", 3)
    end
    
    it 'exists, has a name and length' do
        expect(@cruiser).to be_a(Ship)
        expect(@cruiser.name).to eq("Cruiser")
        expect(@cruiser.length).to eq(3)
    end

    it 'has health' do
        expect(@cruiser.health).to eq(3)
    end

    it 'it defaults to not sunk' do
        expect(@cruiser.sunk?).to eq(false)
    end

    it 'can get hit which decreases health' do
        @cruiser.hit

        expect(@cruiser.health).to eq(2)
    end

    it 'sinks when its health runs out' do
        @cruiser.hit

        expect(@cruiser.health).to eq(2)

        @cruiser.hit

        expect(@cruiser.health).to eq(1)
        expect(@cruiser.sunk?).to eq(false)

        @cruiser.hit

        expect(@cruiser.sunk?).to eq(true)
    end
end