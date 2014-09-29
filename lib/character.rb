class Character
  def initialize(name, job)

    # Initialization method for Character.
    # Input: name:String, job:Symbol
    # Output: character:Character.

    if name.gsub(/\s+/, "").empty? == false
      @name = name
    else
      @name = "Invalid character name."
    end

    if self.starting_jobs.include?(job)
      @job = job
    else
      @job = "Job does not exist."
    end
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

end