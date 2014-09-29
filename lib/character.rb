class Character
  def initialize(name, job)

    # Initialization method for Character.
    # Input: String, Symbol
    # Output: Character.

    @name = name
    @job = job
    @level = 1
    @stats = self.roll_stats

  end

  def name

    # Getter for the character's name.
    # Input: none (self).
    # Output: String.

    @name
  end

  def job

    # Getter for the character's job.
    # Input: none (self)
    # Output: String.

    @job
  end

  def starting_jobs

    # Defines valid starting job choices for a new character.
    # Input: none (self).
    # Output: Array.

    [
      :archer,
      :barbarian,
      :cavalier,
      :cleric,
      :dancer,
      :dark_mage,
      :fighter,
      :knight,
      :lord,
      :mage,
      :manakete,
      :mercenary,
      :myrmidon,
      :pegasus_knight,
      :priest,
      :tactician,
      :taguel,
      :thief,
      :troubadour,
    ]

  end

  def stats

    # Character statistics for battle.
    # Input: none (self).
    # Output: Hash.

    @stats
  end

  def roll_stats

    # Rolls starting stats for new character.
    # Input: none (self).
    # Output: Hash.

    {
      :hp => 15,
      :str => 5,
      :mag => 5,
      :skl => 5,
      :spd => 5,
      :lck => 5,
      :def => 5,
      :res => 5,
      :mov => 5
    }

  end

  def sheet

    # Outputs a formatted overview of the character information.
    # Input: none (self).
    # Output: String.

  end

end