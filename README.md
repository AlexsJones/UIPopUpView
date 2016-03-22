# UIPopUpView

Simply put this was for my own use but I thought other people might find it useful.

This lets you add a long press pop up window on any view with a decent size.

Essentially you can inherit the `UIPopUpViewController` and add items for them to display.

Please see the example project.

Getting going is as simple as `pod install UIPopUpView`

Then in your project simply inherit from `UIPopUpViewController`

###Example

```Swift
class MyController : UIPopUpViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.uiPopUpViewAddControl("Circle", imageName: "circle-sprite", context:0, eventName: "uiPopUpAPressed")
        
    //We want to monitor the notification posted in the control
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("uiPopUpAPressed"), name: "uiPopUpAPressed", object: nil)
  }
}

```

The result of this is:

![Imgur](http://i.imgur.com/MVixtWy.png?1)

video: http://i.imgur.com/lBybyNb.gifv



##Context hoverover

It is possible to change what is displayed as the `UIPopUpViewCell` entries have a context (Int)
In the delegate override it is possible to change the current context depending on where the touches are on screen. You might have noticed the context argument can be an integer.

Before the popup view appears you can override this method to select which context (Int) group to display.

This is the override of the UIPopUpDelegate in the UIPopUpController class that is inherited
```Swift
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

Please look at the `UIPopUpViewController` for methods you can override - it is possible to change things such as pop up shape and size this way.

Inside of the `UIPopUpViewCell`
```Swift
    var view: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
```
You can do all the normal stuff like background modification of color, setting the button how you like; just check out the files to understand more.
