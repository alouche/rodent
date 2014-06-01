# rodent

rodent is a shell (bash) application which:

* Manages multiple versions of Go.
* Allows you to test/track your projects against multiple Go versions.
* Allows cross-compile builds for different platform builds (cgo/stdlib [workaround](https://groups.google.com/d/msg/golang-nuts/2XoGUvBalcw/ErSWiTlO17kJ)).
* Manages/tracks librairies dependencies by expanding the GOPATH
* Create separate workflows within a project per environment (i.e: build projectA with ENV="PRD" on go1.2.2 and ENV="DEV" on go1.3beta2)

This is achieved without getting in your way by making use of [shims](http://en.wikipedia.org/wiki/Shim_%28computing%29).

## Why?

* I wanted something light/small which allowed all the above while being transparent and out of the way.
* Managing and tracking my third party libraries by maintaining a separate directory per project which I could simply "tar; cp and or even git submodule.." 
* I prefer using a custom GOPATH per project (or sometimes have a unique GOPATH for a subset of projects) and wanted to keep the "standard go workflow way of things" while maintaining that flexiblity/option.
* This is an experiment.

## Setup

> git clone http://github.com/alouhe/rodent.git /my/path/to/rodent

Add in your .bashrc, profile etc.

> source "/my/path/to/rodent"

Restart your existing shell or open an new one and you are set. Type "rodent", press <Enter>

Refer to the Quick Start guide.

## Highlight Features

* Define a specific go version per project source
  > echo "gover=go1.2.2 >> .rodentrc

  run "go build"

  Want to switch between multiple go versions in the same project (for testing new builds)
  > echo "gover_ATAG=go1.3beta2" >> .rodentrc
  
  run
  > "export RODENT_ENV=ATAG; go build"
  
  Any rodent variables when suffixed with "\_<LABEL>" are scopped as variables for the defined enviroment scope <LABEL>
  
  variables without these <LABEL> suffixes are used as default variables

* Keep track of your project third party libraries
  > echo "godeps=/my/project/workspace" >> .rodentrc

  A dependency target per environment? easy...
  > echo "godeps_production=./local/prd/path"
  
  > echo "godeps_development=./local/dev/path"
  
  run
  > "export RODENT_ENV=production; go get"
  
  or
  > "export RODENT_ENV=experimental; go build"

You get the idea... so feel free to refer to the Rodent Variables guide.

## Disclaimer

This project is relatively new and not perfect. It still requires a lot of work and does not pretend to be better than the numerous awesome tools the Golang community has created. It is just one way of tackling "Go version and dependency management", if you like it, use it and feel free to contribute.
