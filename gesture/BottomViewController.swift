//
//  BottomViewController.swift
//  gesture
//
//  Created by Jonathan Yee on 7/28/16.
//  Copyright © 2016 Jonathan Yee. All rights reserved.
//

import Foundation
import UIKit

class BottomViewController: ViewController {
    
    override func viewDidLoad() {
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(BottomViewController.showFirstViewController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("swipeupunwind", sender: self)
    }
}