//
//  UIPopUpViewController.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

public class UIPopUpViewController : UIViewController, UIGestureRecognizerDelegate, UIPopUpViewDelegate {
    
    let uiPopUpView : UIPopUpView = UIPopUpView()
    
    var isDisplayed : Bool = false
    
    override public func viewDidLoad() {
        
        uiPopUpView.delegate = self
        
        /* Gesture control */
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: Selector("uiPopUpHandleLongPress:"))
        
        view.addGestureRecognizer(lpgr)
        
        let tpgr = UITapGestureRecognizer(target: self, action: Selector("uiPopUpHandleTapPress:"))
        
        view.addGestureRecognizer(tpgr)
    }
    
    public func uiPopUpViewAddControl(name : String, imageName : String, context: Int = 0, eventName : String) {
        
        self.uiPopUpView.addControl(name, imageName: imageName,context: context, eventName: eventName)

    }
    
    public func uiPopUpViewSizeForView() -> CGSize {
        
        return CGSizeMake(250,250)
    }
    
    public func uiPopUpViewSelectViewContext(parentView : UIView?, position: CGPoint) -> Int {
        
        return 0
    }
    
    public func uiPopUpPointInsideView(location : CGPoint) -> Bool {
        
        return (self.uiPopUpView.view.pointInside(location, withEvent: nil))
    }
    
    public func uiPopUpHandleTapPress(sender: UITapGestureRecognizer) {
        
        let location = sender.locationInView(self.uiPopUpView.view)
        
        if self.uiPopUpPointInsideView(location) != true {
            
            uiPopUpView.dismiss()
        }
    }
    
    public func uiPopUpHandleLongPress(sender: UILongPressGestureRecognizer) {
        
        let location = sender.locationInView(self.view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            if isDisplayed == false {
                
                uiPopUpView.show(self.view, position: location)
                
            }
        }
    }
}