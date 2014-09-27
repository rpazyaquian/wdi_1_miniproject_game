Feature: Character generation

  Character generation should be simple and automated.

  Scenario Outline: Successful character generation

    Inputting character information will generate a matching Character.

    Given I have created a character "<name>" with class "<class>"
    When I submit the info to the generator
    Then it should generate a Character with that "<name>" and "<class>"

    Examples:

    |       input        |      output         |
    | "Robin", Tactician | "Robin - Tactician" |
    | "Lucina", Lord     | "Lucina - Lord"     |
