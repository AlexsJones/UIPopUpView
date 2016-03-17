//
//  UIPopUpViewController.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

class UIPopUpViewController : UIViewController, UIGestureRecognizerDelegate, UIPopUpViewDelegate {
    
    var uiPopUpView : UIPopUpView? = UIPopUpView()
    
    var isDisplayed : Bool = false
    
    deinit {
        Logger.debug("Deinit UIPopUpViewController")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        uiPopUpView?.delegate = nil
        
        uiPopUpView = nil
        
    }
    override func viewDidLoad() {
        
        uiPopUpView?.delegate = self
        
        /* Gesture control */
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: Selector("uiPopUpHandleLongPress:"))
        
        view.addGestureRecognizer(lpgr)
        
        let tpgr = UITapGestureRecognizer(target: self, action: Selector("uiPopUpHandleTapPress:"))
        
        view.addGestureRecognizer(tpgr)
    }
    
    func uiPopUpViewAddControl(popUpViewCell : UIPopUpViewCell) {
        
        self.uiPopUpView?.addControl(popUpViewCell)
    }
    
    func uiPopUpViewSizeForView(popUpView : UIPopUpView) -> CGSize {
        
        return CGSizeMake(250,250)
    }
    
    func uiPopUpViewSelectViewContext(parentView : UIView?, position: CGPoint) -> Int {
        
        return 0
    }
    
    func uiPopUpPointInsideView(location : CGPoint) -> Bool {
        
        return (self.uiPopUpView?.view.pointInside(location, withEvent: nil))!
    }
    
    func uiPopUpHandleTapPress(sender: UITapGestureRecognizer) {
        
        
        let location = sender.locationInView(self.uiPopUpView?.view)
        
        if self.uiPopUpPointInsideView(location) != true {
            
            uiPopUpView?.dismiss()
        }
    }
    
    func uiPopUpHandleLongPress(sender: UILongPressGestureRecognizer) {
        
        let location = sender.locationInView(self.view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            if isDisplayed == false {
                
                uiPopUpView?.show(self.view, position: location)
                
            }
        }
    }
}