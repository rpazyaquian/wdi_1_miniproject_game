class Character
  def initialize(name, fields)

    # Initialization method for Character.
    # Input: name:String.
    # Output: character:Character.

    @name = name
    @fields = fields
  end

  def name

    # Getter for the character's name.
    # Input: none.
    # Output: String.

    @name
  end

  def fields

    # Getter for the character's optional fields.
    # Input: none.
    # Output: Hash.

    @fields
  end

end