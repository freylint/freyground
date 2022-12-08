Feature: Standard messaging interface
  The standard interface used by microservices for messaging.

  Scenario: The runtime needs to know if a service is running
    Then SMI provides keepalive_ping
    And SMI provides keepalive_pong

  Scenario: A service needs ability to query Blackboard
    Then SMI provides blackboard_address_request

  Scenario: service and blackboard need to communicate
    Then SMI provides blackboard_requests enum
  
  Scenario: service needs to respond to request from blackboard
    Then SMI provides blackboard_responses variant
