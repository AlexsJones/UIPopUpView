//
//  UIPopUpViewDelegate.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

public protocol UIPopUpViewDelegate {
    
    func uiPopUpViewSizeForView() -> CGSize
}

extension UIPopUpViewDelegate {
    
    public func uiPopUpViewDidAppear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidAppear")
    }
    
    public func uiPopUpViewDidDisappear() {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidDisappear")
    }
    
    public func uiPopUpViewDidSelectItemAtIndexPath(indexPath: NSIndexPath) {
        Logger.debug("UIPopUpViewDelegate : uiPopUpViewDidSelectItemAtIndexPath")
    }
}