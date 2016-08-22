//
//  ViewController.swift
//  gesture
//
//  Created by Jonathan Yee on 7/27/16.
//  Copyright © 2016 Jonathan Yee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
        
//        do {
//            try listenVolumeButton()
//        } catch is ErrorType {
//            print("cant listen to volume buttons")
//        }
        
    }

    func handleSwipes(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            label.text = "left"
        }
        
        if (sender.direction == .Right) {
            label.text = "right"
        }
        
        if (sender.direction == .Up) {
            label.text = "up"
            
            self.performSegueWithIdentifier("swipeup", sender: self)
        }
        
        if (sender.direction == .Down) {
            label.text = "down"
            
            self.performSegueWithIdentifier("swipedown", sender: self)
        }
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "swipedownunwind" {
                let swipeDownUnwindSegue = SwipeUpUnwindSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: {() -> Void in
                })
                
                return swipeDownUnwindSegue
                
            } else if id == "swipeupunwind" {
                let swipeUpUnwindSegue = SwipeDownUnwindSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: {() -> Void in
                })
                
                return swipeUpUnwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)!
    }
    
    func listenVolumeButton() throws {
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setActive(true)
        audioSession.addObserver(self, forKeyPath: "outputVolume",
                                 options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "outputVolume"{
            print("got in here \(change)")
        }
    }
}

