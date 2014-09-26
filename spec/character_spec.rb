describe Character do

  describe "#new" do

    it "creates a new character" do
      @character = Character.new
      expect(@character).to be_a Character

      it "with given input parameters" do
        @character = Character.new({
          race: "Human",
          role: "Wizard",

          })
      end

    end

  end
end