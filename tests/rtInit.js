import { loadFeature, defineFeature } from "jest-cucumber";

const rtInit = loadFeature("features/rtInit.feature");

defineFeature(rtInit, (test) => {
  test("Runtime has started", ({ given, then, and }) => {
    given(/^Runtime can find (.*)$/, (target) => {
      fail("Not yet implemented");
    });

    then(/^Runtime loads (.*)$/, (target) => {
      fail("Not yet implemented");
    });

    and(/^Runtime starts (.*)$/, (target) => {
      fail("Not yet implemented");
    });
  });
});
