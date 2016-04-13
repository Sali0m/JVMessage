//
//  JVMessageView.swift
//  JVMessage
//
//  Created by Jehan Vossen on 31/01/2016.
//  Copyright © 2016 Jehan Vossen. All rights reserved.
//

import UIKit

class JVMEssage: NSObject {
    static func showMessage(text: String, inView: UIView, font: UIFont = UIFont.systemFontOfSize(14), textColor: UIColor = UIColor.whiteColor(), backgroundColor: UIColor = UIColor.grayColor(), edgeInset: UIEdgeInsets = UIEdgeInsetsZero) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let messageView = JVMessageView(text: text, font: font, textColor: textColor, backgroundColor: backgroundColor)
            
            messageView.alpha = 0
            inView.addSubview(messageView)
            
            let leading = NSLayoutConstraint(item: messageView, attribute: .Leading, relatedBy: .Equal, toItem: inView, attribute: .Leading, multiplier: 1, constant: edgeInset.left)
            leading.identifier = "messageView-Leading"
            let bottom = NSLayoutConstraint(item: messageView, attribute: .Bottom, relatedBy: .Equal, toItem: inView, attribute: .Bottom, multiplier: 1, constant: edgeInset.bottom)
            bottom.identifier = "messageView-Bottom"
            let trailing = NSLayoutConstraint(item: messageView, attribute: .Trailing, relatedBy: .Equal, toItem: inView, attribute: .Trailing, multiplier: 1, constant: edgeInset.right)
            trailing.identifier = "messageView-Trailing"
            NSLayoutConstraint.activateConstraints([leading, bottom, trailing])
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                messageView.alpha = 1
                }) { (finished) -> Void in
                    messageView.start()
            }
        }
    }
    
    static func showErrorMessage(text: String, inView: UIView, font: UIFont = UIFont.systemFontOfSize(14)) {
        self.showMessage(text, inView: inView, font: font, textColor: UIColor.whiteColor(), backgroundColor: UIColor(red: 0.8, green: 0, blue: 0.2, alpha: 1))
    }
}

internal class JVMessageView: UIView {
    
    private(set) var textLabel = UILabel()
    private var showingTimer: NSTimer!
    
    init(text: String, font: UIFont, textColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: CGRectZero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.numberOfLines = 0
        self.textLabel.text = text
        self.addSubview(self.textLabel)
        self.textLabel.font = font
        self.textLabel.textColor = textColor
        self.textLabel.backgroundColor = UIColor.clearColor()
        self.backgroundColor = backgroundColor
        
        let leading = NSLayoutConstraint(item: self.textLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: 5)
        leading.identifier = "messageView-textLabel-leading"
        let top = NSLayoutConstraint(item: self.textLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 5)
        top.identifier = "messageView-textLabel-top"
        let trailing = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: self.textLabel, attribute: .Trailing, multiplier: 1, constant: 5)
        trailing.identifier = "messageView-textLabel-trailing"
        let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: self.textLabel, attribute: .Bottom, multiplier: 1, constant: 5)
        bottom.identifier = "messageView-textLabel-bottom"
        NSLayoutConstraint.activateConstraints([leading, top, trailing, bottom])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("didTap:"))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func didTap(gesture: UITapGestureRecognizer) {
        self.showingTimer.invalidate()
        self.showingTimer = nil
        self.removeFromSuperview()
    }
    
    func start() {
        guard let text = self.textLabel.text else { self.removeFromSuperview(); return }
        self.showingTimer = NSTimer.scheduledTimerWithTimeInterval(self.timeNeeded(text), target: self, selector: Selector("didFinishShowing:"), userInfo: nil, repeats: false)
    }
    
    func didFinishShowing(timer: NSTimer) {
        self.removeFromSuperview()
    }
    
    private func timeNeeded(text: String) -> NSTimeInterval {
        return min(Double(Double(text.characters.count)*0.06 + 0.5), 5.0)
    }
}
