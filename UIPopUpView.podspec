Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.2'
s.name = "UIPopUpView"
s.summary = "Is a simple override for long press with a configurable stack pop up view"
s.requires_arc = true

# 2
s.version = "0.0.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Alex Jones" => "tibbar@freedommail.ch" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "http://tibbar.io"

# For example,
s.homepage = "https://github.com/AlexsJones/UIPopUpView"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/AlexsJones/UIPopUpView.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/JRG-Developer/RWPickFlavor.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "UIPopUpView/*.{swift}"

# 9
s.resources = "UIPopUpView/*.{png,jpeg,jpg,storyboard,xib}"
end