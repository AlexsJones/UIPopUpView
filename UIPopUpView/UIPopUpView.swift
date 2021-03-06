//
//  UIPopUpView.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation


public class UIPopUpView: UIView {
    
    weak var delegate : UIPopUpViewDelegate?

    var controls : [UIPopUpViewCell!] = []
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackview: UIStackView!

    var view: UIView!
    
    deinit {
        Logger.debug("Deinit UIPopUpView")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
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
        
        stackview.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        stackview.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
    
        scrollView.contentSize = CGSizeMake(view.frame.width, view.frame.height)
        
        scrollView.maximumZoomScale = 1.0
        
        scrollView.scrollEnabled = true
        
    }

    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        let nib = UINib(nibName: "PopUpView", bundle: bundle)
        
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    public func selectControlAtLocation(location : CGPoint) -> UIPopUpViewCell? {
        
        for (view) in controls {
 
            Logger.debug("Searching control \(view?.name) for valid point inside")
            
            if view.pointInside(location, withEvent: nil) {
                return view
            }
        }
        
        return nil
    }
    
    public func filterWithContext(context : Int) {
        
        for ( view ) in controls {

            Logger.debug("\(view?.name) -> \(view?.context)")
            if view.context != context {
                view.hidden = true
                stackview.removeArrangedSubview(view!)
            }else {
                view.hidden = false
                
                stackview.addArrangedSubview(view!)
            }
        }
    }
    
    public func show(parentView : UIView, position : CGPoint) {
        
        let context = delegate?.uiPopUpViewSelectViewContext(parentView, position: position)
        
        view.hidden = false
        
        view.frame.size = delegate!.uiPopUpViewSizeForView()
        
        view.center = position
    
        self.filterWithContext(context!)
        
        parentView.addSubview(view)
        
        delegate?.uiPopUpViewDidAppear()
    }
 
    public func dismiss() {
        
        view.hidden = true
                
        view.removeFromSuperview()
    }
    
    public func addControl(name : String, imageName : String, context: Int, eventName : String) {
  
        let popUp = UIPopUpViewCell()
        
        let image = UIImage(named: imageName)!
        
        popUp.setup(name, image: image, notificationName:  eventName)
        
        popUp.context = context
        
        controls.append(popUp)
        
        stackview?.layoutIfNeeded()
    }

}