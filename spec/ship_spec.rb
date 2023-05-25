require './spec/spec_helper'

RSpec.describe Ship do
    cruiser = Ship.new("Cruiser", 3)
    
    it 'exists, has a name and length' do
        expect(cruiser).to be_a(Ship)
        expect(cruiser.name).to eq("Cruiser")
        expect(cruiser.length).to eq(3)
    end

end