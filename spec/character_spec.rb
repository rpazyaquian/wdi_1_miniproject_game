require_relative '../lib/character'

describe Character do

  before(:all) do
    @character = Character.new("Robin", :tactician)
  end

  describe "#new" do
    it "creates a new character" do
      expect(@character).to be_a Character
    end

    it "with a given name" do
      expect(@character.name).to eq "Robin"
    end

    it "with the given job" do
      expect(@character.job).to eq :tactician
    end

    it "requires a valid name" do
      @character = Character.new("\n", :tactician)
      expect(@character.name).to eq "Invalid character name."
    end

    it "requires a valid job choice" do
      @character = Character.new("Lucina", :marth_clone)
      expect(@character.job).to eq "Job does not exist."
    end

  end

end