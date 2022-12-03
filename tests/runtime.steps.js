import { loadFeature, defineFeature } from "jest-cucumber";

const rtInit = loadFeature("features/rtInit.feature");

defineFeature(rtInit, (test) => {
  test("Runtime has started", ({ given, then, and }) => {
    given(/^Runtime can find (.*)$/, (arg0) => {
      fail("Not yet implemented");
    });

    then(/^Runtime loads (.*)$/, (arg0) => {
      fail("Not yet implemented");
    });

    and(/^Runtime starts (.*)$/, (arg0) => {
      fail("Not yet implemented");
    });
  });
});
