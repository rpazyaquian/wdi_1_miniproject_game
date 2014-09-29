require 'pry'
require 'require_all'
# require_relative 'lib/character'
# require_relative 'lib/party'
# require_relative 'lib/menu'
require_all 'lib'

def create_character
end

def create_party
end

def exit
end

def create_option(action, text)
  {
    action => {
      text: text,
      action: method(action).to_proc
    }
  }
end

array = []

array << [:create_character, "Create character"]
array << [:create_party, "Create party"]
array << [:exit, "Exit generator"]

array

options = array.map do |option|
  create_option(option[0], option[1])
end

options.reduce(:merge!)

# character_option = create_option(:create_character, "Create character")
# party_option = create_option(:create_party, "Create character")
# exit_option = create_option(:exit, "Exit generator")

# what = [character_option, party_option, exit_option].reduce(:merge)


# binding.pry

menu = Menu.new(options[0])

menu.prompt