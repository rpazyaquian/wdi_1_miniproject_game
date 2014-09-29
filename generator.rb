require 'pry'
require 'require_all'
# require_relative 'lib/character'
# require_relative 'lib/party'
# require_relative 'lib/menu'
require_all 'lib'


menu = Menu.new(:create_party, :create_character, :exit)

menu.prompt