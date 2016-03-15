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
        
        Logger.debug("Pressed \(title.text)")
    }
    
    func setup(title : String, image : UIImage, onPress : (sender : AnyObject) -> ()) {
        
        self.button.setImage(image, forState: .Normal)
        
        self.button!.block_setAction { sender in
            
            onPress(sender: sender)
        }
        
        self.name = title
        
        self.title.text = title
    }
    
    func setup(title : String, image : UIImage, onPress : (sender : AnyObject) -> (), context: Int) {
     
        self.setup(title,image: image, onPress: onPress)
        
        self.context = context
    }
}