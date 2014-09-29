require_relative '../lib/character'

describe Character do

  describe "#new" do

    before(:all) do
      @character = Character.new("Robin", :tactician)
    end

    it "creates a new character" do
      expect(@character).to be_a Character
    end

    it "with a given name" do
      expect(@character.name).to eq "Robin"
    end

    it "with the given job" do
      expect(@character.job).to eq :tactician
    end

    it "and with randomized stats" do
      stats = [
        :hp,
        :str,
        :mag,
        :skl,
        :spd,
        :lck,
        :def,
        :res,
        :mov
      ]
      stats.each do |stat|
        expect(@character.stats).to have_key(stat)
      end
    end
  end

  describe "#sheet" do

    before(:all) do
      @character = Character.new("Lucina", :lord)
    end

    it "returns a character sheet" do
      expect(@character.sheet).to be_a String
    end

  end

end