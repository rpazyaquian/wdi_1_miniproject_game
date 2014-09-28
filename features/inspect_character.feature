Feature: Character inspection

  Generated characters can be inspected after generation.

  Scenario: Inspecting an existing character

    Given "Robin" the "Tactician" is generated
    When the character is inspected
    Then a list of information should be printed