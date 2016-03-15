# UIPopUpView

Simply put this was for my own use but I thought other people might find it useful.

Essentially you can inherit the `UIPopUpViewController` and add items for them to display.

The `UIPopUpViewCell` items take a closure that using some magic does a block on the UIButton that gets pressed and returned.

You can also override the touch gestures as you'll surely want them back at some point.

###Example

```Swift
class MyController : UIPopUpViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let demoCell = UIPopUpViewCell()
    //edit background color etc
    //demoCell.view.backgroundColor = UIColor.brownColor()
    
    demoCell.setup("Demo", image: UIImage(named: "circle-sprite")!) { (sender) -> () in
    Logger.debug("Pressed Demo")
    
    }
    
    self.uiPopUpViewAddControl(demoCell)
  }
}

```

The result of this is:

![img](http://i.imgur.com/Xu87UVm.png)


#Usage

I'd recommend that you inherit from `UIPopUpViewController` as it already overrides some methods and implements the delegate - To override the default delegate response you can just implement your own and call `super.` first.

##Context hoverover

It is possible to change what is displayed as the `UIPopUpViewCell` entries have a context (Int)
In the delegate override it is possible to change the current context depending on where the touches are on screen. 

###Example

```Swift

//Here we create a delete item to appear if the context is set to one - in this case that is when we hover over a sprite
selectCell.setup("Delete", image: UIImage(named:"circle-sprite")!, onPress: { (sender) -> () in
            
      self.lastSelected?.removeFromParent()
        
}, context: 1)


//This is the override of the UIPopUpDelegate in the UIPopUpController class that is inherited

override func uiPopUpViewSelectViewContext(parentView : UIView, position: CGPoint) -> Int {
      
    super.uiPopUpViewSelectViewContext(parentView, position: position)
    
    let obj = scene!.doesNodeExist(parentView, position: position)
          
    if obj.bool {
    lastSelected = obj.node
         return 1
    } else {
        return 0
    }
}
```


##Customisation

Inside of the `UIPopUpViewCell`
```Swift
    var view: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
```
You can do all the normal stuff like background modification of color, setting the button how you like; just check out the files to understand more.
