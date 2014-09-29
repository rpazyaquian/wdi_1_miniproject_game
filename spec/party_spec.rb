require_relative '../lib/party'
require_relative '../lib/character'

describe Party do

  before(:all) do
    @party = Party.new('Ylisse')
  end

  describe "#new" do

    it "creates a new party" do
      expect(@party.name).to eq 'Ylisse'
    end

  end

  describe "#recruit" do

    before(:all) do
      @character = Character.new("Robin", :tactician)
    end

    it "recruits a new party member" do
      @party.recruit(@character)
      expect(@party.members).to include(@character)
    end

  end

end