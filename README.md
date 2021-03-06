# CEF.swift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)

Swift bindings for the [Chromium Embedded Framework](https://bitbucket.org/chromiumembedded/cef/).

### Requirements

Xcode 8, Swift 2.3/3.0 (see notes below)<br/>
tools: cmake, jq, p7zip

Supported target platforms: macOS 10.10+

### How to build

##### The easy way

You can now build CEF.swift using [Carthage](https://github.com/Carthage/Carthage). Just add the following line to your `Cartfile`:

```
github "lvsti/CEF.swift" "<branch_specifier>"
```

(For the `branch_specifier`, see the notes on branches below.)

Note that the bootstrap build will take quite some time as CEF.swift has to fetch and build external dependencies as well.

##### The oldschool way

1. fetch this repo
2. switch to the appropriate branch in CEF.swift to match the CEF distribution (see notes below)
3. run `scripts/setup.sh` from the repo root
4. now you are ready to compile the CEF.swift framework

### CEF branches

CEF is developed on multiple branches simultaneously, which differ in API and functionality (see [cefbuilds.com](https://cefbuilds.com) and [Spotify OpenSource](http://opensource.spotify.com/cefbuilds/index.html)). CEF.swift aims at supporting the current stable and dev release branches; supporting dev trunk is out of scope for now, however. For any CEF branch `NNNN`, the corresponding CEF.swift branch is named `cef_NNNN`.

Currently supported branches: 

- 3071 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_3071)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 3029 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_3029)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2987 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2987)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2924 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2924)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2883 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2883)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2840 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2840)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2785 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2785)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2743 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2743)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0
- 2704 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2704)](https://travis-ci.org/lvsti/CEF.swift) - Swift 3.0

Archived branches (not maintained anymore):

- 2623 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2623)](https://travis-ci.org/lvsti/CEF.swift) - Swift 2.3
- 2526 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2526)](https://travis-ci.org/lvsti/CEF.swift) - Swift 2.3
- 2454 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2454)](https://travis-ci.org/lvsti/CEF.swift) - Swift 2.3
- 2357 [![Build Status](https://travis-ci.org/lvsti/CEF.swift.svg?branch=cef_2357)](https://travis-ci.org/lvsti/CEF.swift) - Swift 2.3


### Getting started

Check out the (pretty skinny) CEFDemo app under `Samples/CEFDemo` to get the basic idea of how a CEF-based app should look like. For more inspiration, take a look at the `cefsimple` and `cefclient` apps shipped with the CEF binary distribution.

### Disclaimer

This project is incomplete, untested, and most likely unstable, so **use it at your own risk**. Bug reports and suggestions are welcome though.
