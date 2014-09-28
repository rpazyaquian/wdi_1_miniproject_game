Feature: Character generation

  Character generation should be simple and automated.

  Scenario Outline: Successful character generation

    Inputting character information will generate a matching Character.

    Given I have created a character "name" with job "job"
    When I submit the info to the generator
    Then it should generate a Character with that "name" and "job"

    Examples:

    |       input        |      output         |
    | Robin, Tactician   | "Robin - Tactician" |
    | Lucina, Lord       | "Lucina - Lord"     |

  Scenario Outline: Invalid character name

    A character must have some sort of name, even if it is random symbols. A name that resolves to an empty string results is invalid.

    Given I have created a character with an invalid "name"
    When I submit the info to the generator
    Then it should tell me "the name is invalid"

    Examples:
    |    input     |         output          |
    |      \n      | Invalid character name. |
    | \t\n\t\n\t\n | Invalid character name. |

  Scenario Outline: Invalid job choice

    A character's job must be selected from a pre-defined list of job choices. A job that is not in that list of choices is invalid.

    Given I have created a character with a "name" and an invalid "job"
    When I submit the info to the generator
    Then it should tell me "the job doesn't exist"

    Example:
    |        input        |       output        |
    | Robin, Fire Flower  | Job does not exist. |
    | Lucina, Marth Clone | Job does not exist. |