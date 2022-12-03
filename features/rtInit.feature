Feature: Runtime initialization

  Scenario: Runtime has started
    Given Runtime can find <target>
    Then Runtime loads <target>
    And Runtime starts <target>
