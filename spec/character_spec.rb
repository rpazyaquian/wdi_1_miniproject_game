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
  end

  describe "#new", "validation" do

    before(:all) do
      @character = Character.new("\n", :whatever)
    end

    it "requires a valid name" do
      expect(@character.name).to eq :invalid_name
    end

    it "requires a valid job choice" do
      expect(@character.job).to eq :invalid_job
    end

  end

end