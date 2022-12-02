<details>

## Architecture

<summary>Additional project architecture info...</summary>

### Principles

The architecture is created with the following priorities.

- High modularity
- Easy to change
- Don't repeat yourself
- Maintain forward compatibility
- Don't couple modules unless avoiding code repetition
- Don't outrun your headlights

### Technology stack

Any high quality project needs the ability to confirm that it actually works.
The first layer of this is acceptance testing.

#### Acceptance testing

Acceptance testing is provided by Cucumber.
Tests will be written primarily in javascript.
If a test is found to have non-trivial runtime cost, then a test will be written in rust.

#### Integration testing

Integration testing is provided using the best candidate for the services being tested.
In javascript, Jest will be used
In rust, testing will be provided by the built in testing machinery, with criterion used for benchmarks.

#### Unit testing

Unit testing shadows Integration testing, With the accepted unit testing for a language being used.

#### Benchmarking

If a service is found to be a bottleneck, then benchmarking becomes nessecary.
Benchmarking will primarily, be provided by criterion on the assumption that any
performance critical component will first be rewritten in rust.

</details>
