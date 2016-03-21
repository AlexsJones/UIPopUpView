//
//  UIPopUpViewCell.swift
//  CWD
//
//  Created by Alex Jones on 14/03/2016.
//  Copyright © 2016 Alex Jones. All rights reserved.
//

import Foundation

class UIPopUpViewCell : UIView {
    
    var context : Int = 0
    
    var view: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var name : String! = NSUUID().UUIDString
    
    var notificationEventName : String?
    
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
        
        button.imageView!.contentMode = .ScaleAspectFit

        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        let nib = UINib(nibName: "PopUpViewCell", bundle: bundle)
        
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func onPress(sender: UIButton) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(self.notificationEventName!, object: nil)
    }
    
    func setup(title : String, image : UIImage,notificationName : String) {
        
        self.button.setImage(image, forState: .Normal)
        
        self.notificationEventName = notificationName
        
        self.name = title
        
        self.title.text = title
    }
    
    func setup(title : String, image : UIImage,notificationName : String, context: Int) {
     
        self.setup(title,image: image, notificationName:  notificationName)
        
        self.context = context
    }
}