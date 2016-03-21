//
//  UIPopUpViewDelegate.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

public protocol UIPopUpViewDelegate: class{
    
    func uiPopUpViewSelectViewContext(parentView : UIView?, position: CGPoint) -> Int
    
    func uiPopUpViewSizeForView() -> CGSize
}

public extension UIPopUpViewDelegate {
    public func uiPopUpViewDidAppear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidAppear")
    }
    
    public func uiPopUpViewDidDisappear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidDisappear")
    }
}