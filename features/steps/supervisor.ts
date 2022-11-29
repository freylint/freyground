import { When, Then } from "@cucumber/cucumber";

interface ServiceInitFn {
    fn: () => Promise<string>,
}

When("Supervisor is done initializing", ({() => Promise}) => {});