class Party
  def initialize(name)

    # Initializes a new party.
    # Input: String.
    # Output: Party.

    @name = name
    @members = []
  end

  def name

    # Getter for party name.
    # Input: none.
    # Output: String.

    @name
  end

  def recruit(member)

    # Adds a member to the party.
    # Input: Character.
    # Output: Array.

    @members << member
  end

  def members

    # Getter for all members in the party.
    # Input: none.
    # Output: Array.

    @members
  end

end