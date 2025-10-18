---
title: "Repacking Sorcerian"
date: 2025-06-07
---

## Repackaging Sourceian

I've been looking for a minimal first publishable game for a while now.
While leaving youtube on in the background, I ran across a retrospective
of the game _Sorcerian_. You don't care about that though, you just want to
know how to make the game work. Most of the time I would tell you to buy 
a legal copy, but the game is considered abandonware. You can find a copy of it on
its [MyAbandonware](https://www.myabandonware.com/game/sorcerian-10j) page.
While this is fine and dandy for the kind of technical supernerd who
implements their blog from scratch, The average person isn't going
to be willing to put up with this just to play a video game from the 1990's.
I will be packaging the sierra version of sorcerian as a flatpak and msi.

## Outside the package managers

Packaging things for the public is good and all, but I haven't gotten the
game working outside of a packaged environment. Lets get the going, huh?
Well I got a couple things I don't know on account of my never needing to
package a dos application. It goes something like:

- Which version of dosbox should I use?
- Do I bother supporting MacOS?
  - No.
- How many linux packaging systems do I feel like supporting?
  - Flatpak?
  - Appimage
  - Deb/RPM/EBuild
- Is this game actually abandonware?
- Will it stop being abandonware if this project gains any traction?
- Do I want to put effort into making the new player experience suck less?

All these pointless questions and more, coming to a blog near you!

## Building a prototype

The first question seems easy to solve. 

> Which version of DosBox do I use?

A 5 minute google search comes up with A fork called dosbox-x,
which includes a _Dolphin Emulator_ like experience that appeals to
my GenZ sensibilities. It's not a perfect solution. It doesn't
ship binaries for linux. Given that I'm a masochism hardened former
_Gentooo_ user, this shouldn't be a problem, but I'd like to implement
this program in go, so I'd also have to inherit any build dependencies
of _DosBox-x_ if I wanted to go the vendored route. If for whatever reason,
you're seeing this after the initial release and it never got developed,
email me at [imnotpayingyoubut@freyground.com](mailto:imnotpayingyoubut@freyground.com).
If you're nice enough I'll probably do it just for the thrill of having a user.

### Binary Package Management in Go the Dity Way

Just to get things going, I'm going to start by just supporting Windows.
The linux people can be supported if/when I throw out the prototype and
make something library quality. If that day comes, so help my caffeine addiction.
The MacOS people are encouraged to use their excess cash to pool together and
donate the thousands of dollars required to provide decent support for
Their embedded device masquerading as a computer.

The plan is simple, archive the abandonware release of the game and _DosBox-x_. Then
we'll embed them in a _Go_ executable and extract them into their OS's local
application data directory. From there, it's just a matter of starting dosbox
correctly and generating a generic icon for your desktop shortcuts and .desktop files.

### Phase 1: Theory of the Machine

In order to get started I need to implement the _"""business"""_ logic.
The easiest way to do this wihtout getting drowned in the details of
supporting tech is to manually download all the files I'll eventually
be serving by hand and just dumping them in the same folder as the code.
Is this secure? No. Is going to eat up all my _Git Hosting_ LFS storage?
Yes. I guess I'll just have to deny the public the priceless git history
of an ITAD techniciann's early prototype code. My only hope is that
mankind will one day thrive in the absence of this loss.

The concept is simple embed the nessecary data with go's embed tooling:
```go
import(
    _ "embed"
)

//go:embed dosboxx.zip
var DosBoxXWin32Zip
//go:embed socerien_dos.zip
var SorcerianDosZip
```

Then you can just throw in some unpack logic:

```go
package foo

import (
    _ "embed"
    "freyground.com/stubs"
)

//go:embed dosboxx.zip
var DosBoxXWin32Zip
//go:embed socerien_dos.zip
var SorcerianDosZip

func main() {
    stubs.unzip(DosBoxXWin32Zip, stubs.AppDataLocation("/sorcerian/"))
    stubs.unzip(SorcerianDosZip, stubs.AppDataLocation("/sorcerian/bin"))
    stubs.execNow(stubs.AppDataLocation("/sorcerian/bin/dosbox-x.exe"))
}
```

Of course I'll also need to do things like write the dosbox config and acutually 
impelement the stubs, but we'rein abstract psuedoland where everything magically
works and the competence doesn't matter.

## Building the stubs

Now I'm a relatively new to the world of go, so I don't have a well developed
library of utility functions that are commonly used across multiple projects.

### Scaffolding the Freyground Utility Library

I'd like to be able to re-use this supporting code, but I don't want to be on
the hook for ensuring everything is fully tested library quality code for
a prototype. My go to solution for this is to implement a helper library in a
mono repository. Skipping over all the tradeoffs inherent in this decision.
I'm going to stick to a monoglot go approach.

### Building freyground.com/fgutils

I'll assume you know how Go modules are made, so I'll just start planning out the
helper functions that are required for a project like this

#### UnzipArchiveSync

I'll need a way to extract the embedded archive.
I'm implmenting this syncronyously because this project is
intended to be run on end user machines who can afford to waste the cycles.

```go
// Extract a `[]byte` containing a zip archive to folder `dest`.
func UnzipArchiveSync(archive []byte, dest string) (string, err) {}
```

This function will implement the raw archive extraction logic.

#### WriteEmbeddedFile

I'll also need a way to move the embeded dosbox config to disk.
Also a very simple signature.

``` go
func WriteEmbbededFile(file []byte, dest string) (string, error) {}
```

This will allow for writing of the embedded dosbox config.

#### Developed Core Logic

I now have the scaffold to implement the _"""business logic"""_.

```go

type FGExtractorFN = func([]byte, string) (string, error)
func UnpackSrcian(gameExtractor FGExtractorFN, 
                  dboxExtractor FGExtractorFN,
                  cfgWriter FGExtractoFN) (string, error) {}

func ExecSrcian(basedir string) {}

func main() {
    basedir, _ := UnpackSrcian(fgutil.UnpackArchiveSync("omitted"), 
                     fgutil.UnpackArchiveSync("omitted"),
                     fgutil.WraiteEmbbededFile("omitted"))
    ExecSrcian(basedir)
}
```

I'll leave this post at this for now. Onto the actual implementation for me!