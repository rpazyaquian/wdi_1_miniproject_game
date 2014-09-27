require_relative '../lib/character'

describe Character do

  before(:all) do
    @character = Character.new("Robin")
  end

  describe "#new" do
    it "creates a new character" do
      expect(@character).to be_a Character
    end

    it "with a given name" do
      expect(@character.name).to eq "Robin"
    end
  end

end