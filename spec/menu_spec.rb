require 'pry'
require_relative '../lib/menu'

describe Menu do

  before(:each) do

    def say_hello
      "Hello!"
    end

    options = {
      say_hello: {
        text: "Say hello",
        action: method(:say_hello).to_proc
      }
    }

    @menu = Menu.new(options)

    def say_goodbye
      "Goodbye!"
    end

    other_options = {
      say_goodbye: {
        text: "Say goodbye",
        action: method(:say_goodbye).to_proc
      }
    }

    @another_menu = Menu.new(other_options)

  end

  describe "#new" do

    it "instantiates a new Menu object" do
      expect(@menu).to be_a(Menu)
    end

    it "takes a list of options and associated actions" do
      expect(@menu.options).to include(:say_hello)
    end

    it "takes another menu as a potential option" do
      # basically, an option can be another menu, and calling that option's action opens that other menu

      menu_option = {
        menu_option: {
          text: 'Another menu',
          action: @another_menu
        }
      }

      @menu.add(menu_option)
      expect(@menu.options).to include(:menu_option)
    end

  end

  describe "#add" do
    it "adds options passed to it" do
      new_option = {
        new_option: {
          text: "New option",
          action: "new option!?"
        }
      }

      @menu.add(new_option)
      expect(@menu.run(:new_option)).to eq "new option!?"
    end
  end

  describe "#run" do

    it "executes an option's action given its symbol" do
      expect(@menu.run(:say_hello)).to eq "Hello!"
    end

    it "returns an error when an option doesn't exist" do
      expect(@menu.run(:invalid_option)).to eq :invalid_option
    end

  end

  describe "#translate_string" do
    it "translates a string input into its matching symbol" do
      expect(@menu.translate_string('Say hello')).to eq :say_hello
    end
  end

  describe "#prompt" do

    it "prompts the user for a selection and returns the selection" do
      STDIN.stub(gets: 'Say hello')
      expect(@menu.prompt).to eq "Hello!"
    end

    it "recursively prompts the user when the selection is a menu" do

      menu_option = {
        menu_option: {
          text: 'Another menu',
          action: @another_menu
        }
      }

      @menu_only = Menu.new(menu_option)

      STDIN.stub(:gets).and_return('Another menu', 'Say goodbye')
      expect(@menu_only.prompt).to eq 'Goodbye!'
    end

    it "must work if there is more than one possible option" do
      menu_option = {
        menu_option: {
          text: 'Another menu',
          action: @another_menu
        },
        dummy_option: {
          text: "Dummy option",
          action: "dummy option!!!!"
        }
      }

      @menu_with_other_option = Menu.new(menu_option)
      STDIN.stub(:gets).and_return('Another menu', 'Say goodbye')

      expect(@menu_with_other_option.prompt).to eq 'Goodbye!'
    end

    it "must work if options are merged" do
      first_option = {
        dummy_option: {
          text: "Dummy option",
          action: "dummy option!!!!"
        }
      }

      merged_option = {
        merged_option: {
          text: 'Merged menu',
          action: @another_menu
        }
      }

      @merged_menu = Menu.new(first_option)
      # binding.pry
      expect(@merged_menu.options).to include(:dummy_option)

      @merged_menu.add(merged_option)
      expect(@merged_menu.options).to include(:merged_option)

      binding.pry
    end

  end

end