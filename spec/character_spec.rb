require_relative '../lib/character'

describe Character do

  describe "#new" do

    before(:all) do
      @character = Character.new("Robin")
    end

    it "creates a new character" do
      expect(@character).to be_a Character
    end

    it "with a mandatory given name" do
      expect(@character.name).to eq "Robin"
    end

  end
end