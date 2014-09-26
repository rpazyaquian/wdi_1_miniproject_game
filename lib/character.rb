class Character
  def initialize(name)

    # Initialization method for Character.
    # Input: name:String.
    # Output: character:Character.

    @name = name
    @health = 20
  end

  def name

    # Getter for the character's name.
    # Input: none (self).
    # Output: String.

    @name
  end

  def take_damage(damage)

    # Reduces the character's health by `damage`.
    # Input: Fixnum.
    # Output: Fixnum (@health's value).

    @health -= damage
  end

  def health

    # Getter for player's HP.
    # Input: none.
    # Output: Fixnum.

    @health
  end

  def attack(target, damage)
    target.take_damage(damage)
  end

end