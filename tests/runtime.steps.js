import { loadFeature, defineFeature } from "jest-cucumber";

const rtInit = loadFeature("features/rtInit.feature");

defineFeature(rtInit, (test) => {
  test("Runtime has started", ({ given, when, then }) => {});

  given("Runtime can find Blackboard", () => {
    fail("Runtime does not exist");
  });
});
