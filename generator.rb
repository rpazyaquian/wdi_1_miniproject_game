require 'pry'
require_relative 'lib/character'
require_relative 'lib/party'

# "This menu method is enormous - it would be good to break it up into smaller methods.
# Possibly a Menu class could be useful here."

top_menu_options = {
  :create_party => {
    text: 'Create a party',
    action: create_party
  },
  :create_character => {
    text: 'Create a character',
    action: create_character
  },
  :exit_generator => {
    text: 'Exit generator',
    action: exit_generator
  }
}

top_menu = Menu.new(top_menu_options)

# a menu class might not be a bad idea -
# but what does a menu class look like?

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
    show_jobs
    job = get_job(gets.chomp)
  end

end

def create_character
  # Executes the character generator dialogue.
  # Input: none.
  # Output: none.

  puts "What would you like to name your character?"
  name = get_name(gets.chomp)
  puts "Please choose a job for your character:"
  show_jobs
  job = get_job(gets.chomp)
  @party.recruit(Character.new(name, job))
  puts "#{character.name} the #{character.job} has joined your party."
  puts character.sheet

  puts "Would you like to create another character? y/n"
  repeat(create_character)

end

def repeat(option)

  # Queries the user to repeat the last performed action.
  # Input: Method.
  # Output: Method.

  repeat = gets.chomp
  while not ['y', 'n'].include?(repeat)
    puts "Sorry, I don't understand that option."
    puts "Please enter 'y' or 'n'."
    repeat = gets.chomp
  end
  if repeat == 'y'
    option
  else
    return
  end

end

def create_party

  # Generates a new Party.
  # Input: none.
  # Output: none.

  puts "What would you like to name your party?"
  name = gets.chomp
  while name.gsub(/\s+/, "").empty?
    puts "Sorry, your party has to have a valid name."
    name = gets.chomp
  end
  @party = Party.new(name)
  puts "#{@party.name} has been formed."
  puts "Please add some characters."
  create_character
end

def menu_options

  # Queries the user for menu options.
  # Input: none.
  # Output: none.

  # note: this badly needs refactoring

  puts "What would you like to do?"
  [
    'Create a (p)arty',
    'Generate a new (c)haracter',
    '(Q)uit the generator'
  ].each do |option|
    puts option
  end

  choice = gets.chomp.downcase
  while not %w(p c q).include?(choice)
    puts "Sorry, that's not a valid menu option."
    choice = gets.chomp.downcase
  end

  if choice == 'p'
    if defined?(@party)
      puts "You've already made a party called #{@party.name}."
    else
      generate_party
    end
  elsif choice == 'c'
    if defined?(@party).nil?
      puts "You haven't made a party yet!"
    else
      create_character
    end
  elsif choice == 'q'
    puts "Goodbye!"
    exit(0)
  end

end

def menu
  # Top-level menu.
  # Input: none.
  # Output: none.

  puts "Welcome to my Fire Emblem party generator!"
  while true
    menu_options
  end
end

menu