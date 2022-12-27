//! This is a set of Jest tests which test the SMI using it's autodocs.

import { defineFeature, loadFeature } from "jest-cucumber";
import {KeepAliveMsg} from "../../../build/dist/lib/smi/smi";

/// The cucumber feature to be tested
const feature = loadFeature("features/smi.feature");

defineFeature(feature, (test) => {
  test("The runtime needs to know if a service is running", ({ then, and }) => {
    then("SMI provides keepalive_ping", () => {
      KeepAliveMsg.Ping;
    });

    and("SMI provides keepalive_pong", () => {
      KeepAliveMsg.Pong;
    });
  });

  test("A service needs ability to query Blackboard", ({ then }) => {
    then("SMI provides blackboard_address_request", () => {
      notYetImplemented();
    });
  });

  test("service and blackboard need to communicate", ({ then }) => {
    then("SMI provides blackboard_requests enum", () => {
      notYetImplemented();
    });
  });

  test("service needs to respond to request from blackboard", ({ then }) => {
    then("SMI provides blackboard_responses variant", () => {
      notYetImplemented();
    });
  });
});
