## Architecture

```plantuml
skinparam backgroundColor transparent
skinparam monochrome reverse
rectangle Runtime {
    rectangle "Runtime Apps" as rtapps {
        [Supervisor] as supervisor
        [Blackboard] as blackboard
    }

    rectangle {
        () "Input" as rtwsin
        () "Output" as rtwsout
        () "socket" as rtsock

        rtwsin .u.> rtsock
        rtsock .d.> rtwsout
    }

    supervisor ..> rtwsin
    rtwsout ..> supervisor
    blackboard ..> rtwsin
    rtwsout ..> blackboard
}

rectangle Website {
    rectangle "Website Apps" as fgapps {
        [Freyground Frontend] as frontend
        [Freyground Backend] as backend
    }

    rectangle {
        () "Input" as fgwsin
        () "Output" as fgwsout
        () "socket" as fgsock

        fgwsin .u.> fgsock
        fgsock .d.> fgwsout
    }
    frontend ..> fgwsin
    fgwsout ..> frontend
    backend ..> fgwsin
    fgwsout ..> backend
}

rectangle Applets {
    rectangle "Applet Apps" as apps {
        [OhioBot] as ohiobot
    }

    rectangle {
        () "Input" as appwsin
        () "Output" as appwsout
        () "socket" as appsock

        appwsin .u.> appsock
        appsock .d.> appwsout
    }

    ohiobot .u.> appwsin
    appwsout .d.> ohiobot
}

() "Standard Messaging Interface" as smi
fgsock <.d.> smi
rtsock <.d.> smi
appsock <.u.> smi

```

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
