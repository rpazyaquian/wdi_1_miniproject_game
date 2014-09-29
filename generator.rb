require 'pry'
require_relative 'lib/character'

def get_name(name)

  # Gets the name for the character from the user.
  # Input: String.
  # Output: String.

  while name.gsub(/\s+/, "").empty?
    puts "Sorry, you must give your character a non-empty name."
    name = get_name(gets.chomp)
  end
  name
end

def show_jobs

  # Possible starting jobs for the character.
  # Input: none.
  # Output: String.

  jobs = Character.starting_jobs.map do |job|
    job = job.to_s.gsub(/_/, " ").split(" ").map do |word|
      word.capitalize
    end
    job.join(" ")
  end

  puts jobs.join(", ")
end

def get_job(job)

  # Gets a job choice for the character from the user.
  # Input: String.
  # Output: Symbol.

  job = job.gsub(/\s+/, "_").downcase.to_sym

  unless Character.starting_jobs.include?(job)
    puts "Sorry, that's not a valid job. Please try again."
    puts jobs
    job = get_job(gets.chomp)
  end

end

def generate_character
  # Executes the top-level generator menu.
  # Input: none.
  # Output: none.

  puts "What would you like to name your character?"
  name = get_name(gets.chomp)
  puts "Please choose a job for your character:"
  show_jobs
  job = get_job(gets.chomp)
  character = Character.new(name, job)
  puts "#{character.name} has joined your party."
  puts character.sheet
  puts "Would you like to create another character? y/n"
  repeat = gets.chomp
  while not ['y', 'n'].include?(repeat)
    puts "Sorry, I don't understand that option."
    puts "Please enter 'y' or 'n'."
    repeat = gets.chomp
  end
  if repeat == 'y'
    generate_character
  else
    return
  end
end

puts "Welcome to my character generator!"
generate_character