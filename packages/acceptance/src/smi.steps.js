//! This is a set of Jest tests which test the SMI using it's autodocs.

import { defineFeature, loadFeature } from "jest-cucumber";
const fs = require("fs");
const path = require("path");

/// The cucumber feature to for testing
const feature = loadFeature("features/smi.feature");

/// Boostrap the WASM module being tested
describe("SMI Acceptance Tests", () => {
  let smi;

  beforeAll(async () => {
    const wasmPath = path.resolve(
      __dirname,
      "../../../build/cache/wasm32-unknown-unknown/release/",
      "smi.wasm"
    );
    const buffer = fs.readFileSync(wasmPath);
    const results = await WebAssembly.instantiate(buffer, {
      env: {
        memoryBase: 0,
        tableBase: 0,
        memory: new WebAssembly.Memory({ initial: 0 }),
        table: new WebAssembly.Table({ initial: 4, element: "anyfunc" }),
        abort: console.log,
      },
    });
    smi = results.instance.exports;
  });

  defineFeature(feature, (test) => {
    test("The runtime needs to know if a service is running", ({
      then,
      and,
    }) => {
      then("SMI provides keepalive_ping", () => {
        smi.KeepAliveMsg.Ping;
      });

      and("SMI provides keepalive_pong", () => {
        smi.KeepAliveMsg.Pong;
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
});
