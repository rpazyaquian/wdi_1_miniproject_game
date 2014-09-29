require 'pry'
require_relative 'lib/character'

puts "Welcome to my character generator!"
puts "What would you like to name your character?"
name = get_name(gets.chomp)
puts "Please choose a job for your character:"
show_jobs
job = get_job(gets.chomp)
character = Character.new(name, job)
puts "#{character.name} has joined your party."
puts character.sheet