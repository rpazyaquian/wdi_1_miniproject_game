Feature: Character inspection

  Generated characters can be inspected after generation.

  Scenario: Inspecting an existing character

    Given "Robin" the "Tactician" is generated
    When the character is inspected
    Then it should print "Robin - Tactician\nHP: 19\nStr: 6\nMag: 5\nSkl: 5\nSpd: 6\nLck: 4\nDef: 6\nRes: 4\nMov: 5"