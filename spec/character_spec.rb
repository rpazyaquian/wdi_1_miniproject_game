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

  describe "#take_damage" do
    it "takes damage" do
      @character.take_damage(10)
      expect(@character.health).to eq 10
    end
  end

  describe "#attack" do
    it "causes another character to take damage" do
      @character.attack(@character, 5)
      expect(@character.health).to eq 5
    end
  end

end