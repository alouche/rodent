# rodent
[![Build Status](https://drone.io/github.com/alouche/rodent/status.png)](https://drone.io/github.com/alouche/rodent/latest)

rodent is a shell (bash) application which:

* Manages multiple releases of Go.
* Allows you to test/build your projects against multiple Go releases.
* Allows cross-compile builds for different platform targets (cgo/stdlib [workaround](https://groups.google.com/d/msg/golang-nuts/2XoGUvBalcw/ErSWiTlO17kJ)).
* Manages/tracks librairies dependencies by expanding the GOPATH
* Create separate workflows within a project per environment (i.e: build projectA with ENV="PRD" on go1.2.2 and ENV="DEV" on go1.3beta2)

This is achieved without getting in your way or hijacking your shell executables/builtins by making use of [shims](http://en.wikipedia.org/wiki/Shim_%28computing%29).

## Highlight Features

* Define a specific go version per project source/directory
  > echo "gover=go1.2.2" >> .rodentrc

  run "go build"

  Want to switch between multiple go versions in the same project (for testing new builds)
  > echo "gover_ATAG=go1.3beta2" >> .rodentrc
  
  run
  > export RODENT_ENV=ATAG; go build
  
  Any rodent variables when suffixed with "\_<LABEL>" are scopped as variables for the defined enviroment scope <LABEL>
  
  variables without these <LABEL> suffixes are used as default variables

* Keep track of your project third party libraries
  > echo "godeps=/my/project/workspace" >> .rodentrc

  A dependency target per environment? easy...
  > echo "godeps_production=./local/prd/path" >> .rodentrc
  
  > echo "godeps_development=./local/dev/path" >> .rodentrc
  
  run
  > export RODENT_ENV=production; go get
  
  or
  > export RODENT_ENV=experimental; go build

You get the idea... so feel free to refer to the [rodentrc guide](https://github.com/alouche/rodent/wiki/rodentrc-file).

## Install

> git clone http://github.com/alouhe/rodent.git /my/path/to/rodent

Add in your .bashrc, profile etc.

> [[ -s "/my/path/to/rodent" ]] && source "/my/path/to/rodent"

Restart your existing shell or open an new one and you are set. Type "rodent".

## Usage

> rodent -h

### Update rodent

> rodent system -u

### List Go releases

> rodent install -l

### Install a Go release

> rodent install go1.2.2

### Set a version of Go globally

> rodent set -g go1.2.2

### Enable cross-compilation for freebsd_amd64

> rodent install -p freebsd_amd64 go1.2.2

For more info, refer to [cross-compilation environment](https://github.com/alouche/rodent/wiki/cross-compilation-setup)

## Why this project?

* I wanted something light/small which allowed all the above while being transparent and out of the way.
* Managing and tracking my third party libraries by maintaining a separate directory per project which I could simply "tar; cp and or even git submodule.." 
* I prefer using a custom GOPATH per project (or sometimes have a unique GOPATH for a subset of projects) and wanted to keep the "standard go workflow way of things" while maintaining that flexiblity/option.
* This is an experiment.

### Disclaimer

This project is relatively new and not perfect. It still requires a lot of work and does not pretend to be better than the numerous awesome tools the Golang community has created. It is just one way of tackling "Go version and dependency management", if you like it, use it and feel free to contribute.

## Contributing
rodent is not locked to a specific way of doing things, so if you have or found a better way to do things or tackle some of the challenges listed here, then I would love to hear of it, so "Go" forth - fork, patch, submit and inspire. The only dependency is that rodent should remain non-intrusive to the user's workflow and relatively light.

## License

(The MIT License)

Copyright (c) 2014 Ali Abbas

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
