require_relative '../lib/menu'

describe Menu do

  before(:all) do

    def hello
      "Hello!"
    end

    def goodbye
      "Goodbye!"
    end

    options =
      {
        :say_hello => {
          text: "Say hello",
          action: hello
        },
        :say_goodbye => {
          text: "Say goodbye",
          action: goodbye
        }
      }

    @menu = Menu.new(options)
  end

  describe "#new" do
    it "takes a Hash of options and associated data" do
      expect(@menu.options).to be_a(Hash)
    end
  end

  describe "#choices" do

    it "creates choices based on its options" do
      expect(@menu.choices).to include('Say hello')
    end

  end

  describe "#add" do
    it "adds an option to its list of options and actions" do

      new_option = {
        :new_option => {
          text: 'New option',
          action: 'new option!?'
        }
      }

      @menu.add(new_option)

      expect(@menu.choices).to include('New option')
    end
  end

  describe "#choose" do

    before(:all) do

      def goodnight
        "Goodnight!"
      end

      another_option = {
        :say_goodnight => {
          text: 'Say goodnight',
          action: goodnight
        }
      }

      @another_menu = Menu.new(another_option)
    end

    it "invokes actions based on a choice of options" do
      expect(@menu.choose("Say hello")).to eq "Hello!"
    end

    it "invokes other menus as actions" do

      another_menu = {
        :another_menu => {
          text: 'Another menu',
          action: @another_menu
        }
      }

      @menu.add(another_menu)

      expect(@menu.choose('Another menu').choose('Say goodnight')).to eq 'Goodnight!'
    end

  end

end