require 'pry'
require_relative 'lib/character'

name = ARGV[0]
job = ARGV[1]

character = Character.new(name, job)

print "#{character.name} - #{character.job}"