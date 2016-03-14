# UIPopUpView

Simply put this was for my own use but I thought other people might find it useful.

Essentially you can inherit the `UIPopUpViewController` and add items for them to display.

The `UIPopUpViewCell` items take a closure that using some magic does a block on the UIButton that gets pressed and returned.

You can also override the touch gestures as you'll surely want them back at some point.

Example

```Swift
class MyController : UIPopUpViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let demoCell = UIPopUpViewCell()
    demoCell.setup("Demo", image: UIImage(named: "circle-sprite")!) { (sender) -> () in
    Logger.debug("Pressed Demo")
    
    }
    
    self.uiPopUpViewAddControl(demoCell)
  }
}

```

The result of this is:

video: http://i.imgur.com/maMuwC4.webm

![img](http://i.imgur.com/Xu87UVm.png)


##Customisation

Inside of the `UIPopUpViewCell`
```Swift
    var view: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
```
You can do all the normal stuff like background modification of color, setting the button how you like; just check out the files to understand more.
