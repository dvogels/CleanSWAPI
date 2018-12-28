# Clean SWAPI

This project demonstrates the use of newer and older best practices for iOS development by consuming the free Star Wars API on https://swapi.co/.

## Getting Started

Just clone the project
```
git clone https://github.com/dvogels/CleanSWAPI
```

### Prerequisites

Make sure you have installed :
- Homebrew (https://brew.sh)
- RBENV(https://github.com/rbenv/rbenv)
- Install the appropriate ruby version in RBENV, found in .ruby-version

### Installing

In your terminal, go to the project directory

- Install Bundler if this gem is not installed yet :

```
gem install bundler
```

- Install all gems locally in the vendor/bundle directory

```
bundle install --path vendor/bundle
```

- Install all Cocoapods in the Podfile

```
bundle exec pod install
```

- Open cleanswapi.xcworkspace

## Acknowledgments

* https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518
* https://edit.theappbusiness.com/modular-ios-strangling-the-monolith-4a6843a28992
* https://www.raywenderlich.com/5542-enum-driven-tableview-development
