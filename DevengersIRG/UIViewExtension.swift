import UIKit

extension UIView {
    
    /**
    Creates a lightGray view on top of the specified UIView and places a UIActivityIndicator atop it
    */
    func lock() {
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = MainColor.MainOrangeColor()
            lockView.contentMode = UIViewContentMode.ScaleAspectFill
            let blurEffectView = UIVisualEffectView(frame: lockView.frame)
            blurEffectView.effect = UIBlurEffect(style: .Dark)
            blurEffectView.alpha = 0.9
            lockView.addSubview(blurEffectView)
            
            lockView.tag = 10
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(activityIndicatorStyle: .White)
            activity.hidesWhenStopped = true
            activity.center = lockView.center
            lockView.addSubview(activity)
            activity.startAnimating()
            addSubview(lockView)
            
            UIView.animateWithDuration(0.2) {
                lockView.alpha = 1.0
            }
        }
    }
    
    /**
    remioves the placed lockView
    */
    func unlock() {
        if let lockView = viewWithTag(10) {
            UIView.animateWithDuration(0.2, animations: {
                lockView.alpha = 0.0
                }) { finished in
                    lockView.removeFromSuperview()
            }
        }
    }
}
