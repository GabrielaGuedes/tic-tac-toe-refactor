Feature: Game
  Scenario: The executable works
    When I run `game` interactively
    Then the output should contain "Enter [0-8]:"

  Scenario: The computer wins the game
    When I run `game` interactively

    And I type "0"
    And I type "1"
    And I type "3"

    Then the output should contain:
    """
     O | O | X
    ===+===+===
     O | X | 5
    ===+===+===
     X | 7 | 8
    Game over
    """

  Scenario: The human and computer ties
