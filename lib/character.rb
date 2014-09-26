class Character
  def initialize(name, fields={}, options={})

    # Initialization method for Character.
    # Input: name:String.
    # Output: character:Character.

    @name = name
    @fields = fields
  end

  def name

    # Getter for the character's name.
    # Input: none (self).
    # Output: String.

    @name
  end

  def fields

    # Getter for the character's optional fields.
    # Input: none (self).
    # Output: Hash.

    @fields
  end

  def sheet

    # Returns a hash of all information for a character.
    # Input: none (self).
    # Output: Hash.

    { name: @name }.merge(@fields)
  end

end