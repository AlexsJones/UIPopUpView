//
//  UIPopUpView.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation


class UIPopUpView: UIView {
    
    var delegate : UIPopUpViewDelegate! = nil
    
    var controls : [UIPopUpViewCell] = [UIPopUpViewCell]()
    
    @IBOutlet weak var stackview: UIStackView!

    var view: UIView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    func xibSetup() {
        
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        view.layer.cornerRadius = 5
        
        view.layer.masksToBounds = true
        
        view.alpha = 0.8
        
        addSubview(view)
        
        stackview.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        
        stackview.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
    }

    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        let nib = UINib(nibName: "PopUpView", bundle: bundle)
        
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    func selectControlAtLocation(location : CGPoint) -> UIPopUpViewCell? {
        
        for (view) in controls {

            Logger.debug("Searching control \(view.name) for valid point inside")
            
            if view.pointInside(location, withEvent: nil) {
                return view
            }
        }
        
        return nil
    }
    
    func show(parentView : UIView, position : CGPoint) {
        
        view.hidden = false
        
        view.frame.size = delegate.uiPopUpViewSizeForView()
        
        view.center = position
    
        parentView.addSubview(view)
        
        delegate.uiPopUpViewDidAppear()
    }
    
    func dismiss() {
        
        view.hidden = true
        
        view.removeFromSuperview()
    }
    
    func addControl(control : UIPopUpViewCell) {
        
        controls.append(control)
        
        stackview.addArrangedSubview(control)
        
        stackview.layoutIfNeeded()
    }
   
}