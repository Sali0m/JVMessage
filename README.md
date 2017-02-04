# JVMessage

[![CI Status](http://img.shields.io/travis/Sali0m/JVMessage.svg?style=flat)](https://travis-ci.org/Sali0m/JVMessage)
[![Version](https://img.shields.io/cocoapods/v/JVMessage.svg?style=flat)](http://cocoapods.org/pods/JVMessage)
[![License](https://img.shields.io/cocoapods/l/JVMessage.svg?style=flat)](http://cocoapods.org/pods/JVMessage)
[![Platform](https://img.shields.io/cocoapods/p/JVMessage.svg?style=flat)](http://cocoapods.org/pods/JVMessage)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### CocoaPods

JVMessage is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JVMessage"
```

### Manually

Import the file JVMessage.swift in your project.

## Author

Sali0m, jehan.vossen@gmail.com

## License

JVMessage is available under the MIT license. See the LICENSE file for more info.

# JVMessage

![example](http://www.saliom.be/githubImg/JVMessage.gif)

JVMessage is a simple way of showing a temporary message, some may call it a toaster. It's currently showing at bottom of the desired view.

## Usage
```
JVMessage.showMessage("Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine.", inView: self.view)

JVMessage.showErrorMessage("Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine.", inView: self.view)
```

You can subclass JVMessage to add utility function such as `showSuccess(...)` for example, or you can make an extension to do so.

You can change lot of settings in `showMessage(...)`, here is the list:
- text ==> The message to be displayed
- inView ==> The view in which to display the message
- font ==> The font your text should take
- textColor ==> The color of your text
- backgroundColor ==> The background color of the JVMessage view
- edgeInset ==> The edgeInset of the label inside of the JVMessage view

For more information check out the project and run it.
