require './spec/spec_helper'

RSpec.describe Ship do
    cruiser = Ship.new("Cruiser", 3)
    
    it 'exists, has a name and length' do
        expect(cruiser).to be_a(Ship)
        expect(cruiser.name).to eq("Cruiser")
        expect(cruiser.length).to eq(3)
    end

    it 'has health' do
        expect(cruiser.health).to eq(3)
    end

    it 'it defaults to not sunk' do
        expect(cruiser.sunk?).to eq(false)
    end

    it 'can get hit which decreases health' do
        cruiser.hit

        expect(cruiser.health).to eq(2)
    end

end