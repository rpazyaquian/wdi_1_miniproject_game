require_relative '../lib/character'

describe Character do

  describe "#new" do

    before(:all) do
      fields = {
        race: "Human",
        role: "Tactician",
        level: 1,
        stats: {
          :hp => 19,
          :str => 6,
          :mag => 5,
          :skl => 5,
          :spd => 6,
          :lck => 4,
          :def => 6,
          :res => 4,
          :mov => 5
        }
      }
      @character = Character.new("Robin", fields)
    end

    it "creates a new character" do
      expect(@character).to be_a Character
    end

    it "with a mandatory given name" do
      expect(@character.name).to eq "Robin"
    end

    it "and an optional set of fields" do
      expect(@character.fields.has_key?(:stats)).to be true
    end

  end
end