//
//  UIPopUpViewDelegate.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

public protocol UIPopUpViewDelegate {
    
    func uiPopUpViewSelectViewContext(parentView : UIView?, position: CGPoint?) -> Int
    
    func uiPopUpViewSizeForView(popupView : UIPopUpView?) -> CGSize
}

extension UIPopUpViewDelegate {
    
    public func uiPopUpViewSelectViewContext(parentView : UIView?, position: CGPoint?) -> Int {
        
        return 0
    }
    
    public func uiPopUpViewSizeForView(popupView : UIPopUpView?) -> CGSize {
        
        return CGSizeMake(250, 250)
    }
    
    public func uiPopUpViewDidAppear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidAppear")
    }
    
    public func uiPopUpViewDidDisappear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidDisappear")
    }
}