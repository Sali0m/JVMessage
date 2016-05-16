# JVMessage


![example](http://www.saliom.be/githubImg/JVMessage.gif)

JVMessage is a simple way of showing a temporary message, some may call it a toaster. It's currently showing at bottom of the desired view.

## Installation

`CocoaPods` will be coming soon

For now import the file JVMessage.swift in your project.

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
