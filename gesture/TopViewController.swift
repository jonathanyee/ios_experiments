//
//  TopViewController.swift
//  gesture
//
//  Created by Jonathan Yee on 7/27/16.
//  Copyright © 2016 Jonathan Yee. All rights reserved.
//

import Foundation
import UIKit

class TopViewController: ViewController {
    
    override func viewDidLoad() {
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(TopViewController.showFirstViewController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("swipedownunwind", sender: self)
    }
}