//
//  SwipeDownUnwindSegue.swift
//  gesture
//
//  Created by Jonathan Yee on 7/28/16.
//  Copyright © 2016 Jonathan Yee. All rights reserved.
//

import Foundation
import UIKit

class SwipeDownUnwindSegue: UIStoryboardSegue {
    override func perform() {
        // Assign the source and destination views to local variables.
        let secondVCView = self.sourceViewController.view as UIView!
        let firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
        }) { (Finished) -> Void in
            
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}