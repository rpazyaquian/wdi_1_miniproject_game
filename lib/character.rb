class Character
  def initialize(name, job)

    # Initialization method for Character.
    # Input: name:String.
    # Output: character:Character.

    if name.gsub(/\s+/, "").empty? == false
      @name = name
    else
      @name = "Invalid character name."
    end

    if self.jobs.include?(job.gsub(/\s+/, "").to_sym)
      @job = job.to_sym
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

  def jobs

    # Defines valid job choices for a new character.
    # Input: none (self).

  end

end