require_relative 'lib/character.rb'
require 'pry'

rebecca = Character.new("Rebecca", YAML.load_file('rebecca.yml'))

