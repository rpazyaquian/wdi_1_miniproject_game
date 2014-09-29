class Menu

  def initialize(options)

    # Creates options for a menu.
    # Input: Hash of hashes.
    # Output: Menu.

    @options = options

    # Choices translate the plain text of an option
    # into its symbol representation.

    @choices = {}

    options.each do |key, value|
      @choices[value[:text]] = key
    end

  end

  def options

    # Getter for options.
    # Input: none.
    # Output: Hash of hashes.

    @options
  end

  def choices

    # Getter for choices.
    # Input: none.
    # Output: Hash of hashes.

    @choices
  end

  def add(options)

    # Adds a hash of options to the menu's options.
    # Input: Hash.
    # Output:

    @options.merge!(options)

    options.each do |key, value|
      @choices[value[:text]] = key
    end
  end

end