Feature: Supervisor
    Program which manages the various microservices

  Scenario: Initialize supervised services
    Given Supervisor is initializing
    When Supervisor is done initializing
    Then Initialize blackboard
    When Blackboard is initialized
    Then Initialize webserver
    And Initialize logserver
    And Initialize OhioBot

  Scenario: We need to poll for application state
    Given We can communicate with the blackboard
    When We're not busy doing other things
    And Some time has passed
    Then Tell blackboard to ping Webserver
    And Tell blackboard to ping OhioBot

  Scenario: Supervised service not responding
    Given Supervisor can identify fault
    When Supervisor can remediate fault
    Then Log failure
    And Attempt to recover
    When Supervisor cannot identify fault
    Then Log failure
    And Restart all supervised services
    When Nonresponsive service is blackboard
    Then Restart all supervised services

  Scenario: Application needs to terminate
    When Termination signal is unexpected
    Then Log termination
    And Attempt to terminate