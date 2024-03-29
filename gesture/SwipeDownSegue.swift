//
//  SwipeDownSegue.swift
//  gesture
//
//  Created by Jonathan Yee on 7/27/16.
//  Copyright © 2016 Jonathan Yee. All rights reserved.
//

import Foundation
import UIKit

class SwipeDownSegue: UIStoryboardSegue {
    override func perform() {
        // Assign the source and destination views to local variables.
        let secondVCView = self.sourceViewController.view as UIView!
        let firstVCView = self.destinationViewController.view as UIView!
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        firstVCView.frame = CGRectMake(0.0, -screenHeight, screenWidth, screenHeight)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
        }) { (Finished) -> Void in
            
            self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
    }
}