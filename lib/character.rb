class Character
  def initialize(name, job)

    # Initialization method for Character.
    # Input: name:String.
    # Output: character:Character.

    @name = name
    @job = job
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

end