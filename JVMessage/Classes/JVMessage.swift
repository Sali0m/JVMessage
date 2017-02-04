//
//  JVMessageView.swift
//  JVMessage
//
//  Created by Jehan Vossen on 31/01/2016.
//  Copyright © 2016 Jehan Vossen. All rights reserved.
//

import UIKit

public class JVMessage {
    static public func showMessage(_ text: String, inView: UIView, font: UIFont = UIFont.systemFont(ofSize: 14), textColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.gray, edgeInset: UIEdgeInsets = UIEdgeInsets.zero) {
        DispatchQueue.main.async { () -> Void in
            let messageView = JVMessageView(text: text, font: font, textColor: textColor, backgroundColor: backgroundColor)
            
            messageView.alpha = 0
            inView.addSubview(messageView)
            
            let leading = NSLayoutConstraint(item: messageView, attribute: .leading, relatedBy: .equal, toItem: inView, attribute: .leading, multiplier: 1, constant: edgeInset.left)
            leading.identifier = "messageView-Leading"
            let bottom = NSLayoutConstraint(item: messageView, attribute: .bottom, relatedBy: .equal, toItem: inView, attribute: .bottom, multiplier: 1, constant: edgeInset.bottom)
            bottom.identifier = "messageView-Bottom"
            let trailing = NSLayoutConstraint(item: messageView, attribute: .trailing, relatedBy: .equal, toItem: inView, attribute: .trailing, multiplier: 1, constant: edgeInset.right)
            trailing.identifier = "messageView-Trailing"
            NSLayoutConstraint.activate([leading, bottom, trailing])
            
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                messageView.alpha = 1
                }, completion: { (finished) -> Void in
                    messageView.start()
            }) 
        }
    }
    
    static public func showErrorMessage(_ text: String, inView: UIView, font: UIFont = UIFont.systemFont(ofSize: 14)) {
        self.showMessage(text, inView: inView, font: font, textColor: UIColor.white, backgroundColor: UIColor(red: 0.8, green: 0, blue: 0.2, alpha: 1))
    }
}

internal class JVMessageView: UIView {
    
    fileprivate(set) var textLabel = UILabel()
    fileprivate var showingTimer: Timer!
    
    init(text: String, font: UIFont, textColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.numberOfLines = 0
        self.textLabel.text = text
        self.addSubview(self.textLabel)
        self.textLabel.font = font
        self.textLabel.textColor = textColor
        self.textLabel.backgroundColor = UIColor.clear
        self.backgroundColor = backgroundColor
        
        let leading = NSLayoutConstraint(item: self.textLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 5)
        leading.identifier = "messageView-textLabel-leading"
        let top = NSLayoutConstraint(item: self.textLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 5)
        top.identifier = "messageView-textLabel-top"
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.textLabel, attribute: .trailing, multiplier: 1, constant: 5)
        trailing.identifier = "messageView-textLabel-trailing"
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.textLabel, attribute: .bottom, multiplier: 1, constant: 5)
        bottom.identifier = "messageView-textLabel-bottom"
        NSLayoutConstraint.activate([leading, top, trailing, bottom])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(JVMessageView.didTap(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func didTap(_ gesture: UITapGestureRecognizer) {
        self.showingTimer.invalidate()
        self.showingTimer = nil
        self.removeFromSuperview()
    }
    
    func start() {
        guard let text = self.textLabel.text else { self.removeFromSuperview(); return }
        self.showingTimer = Timer.scheduledTimer(timeInterval: self.timeNeeded(text), target: self, selector: #selector(JVMessageView.didFinishShowing(_:)), userInfo: nil, repeats: false)
    }
    
    func didFinishShowing(_ timer: Timer) {
        self.removeFromSuperview()
    }
    
    fileprivate func timeNeeded(_ text: String) -> TimeInterval {
        return min(Double(Double(text.characters.count)*0.06 + 0.5), 5.0)
    }
}
