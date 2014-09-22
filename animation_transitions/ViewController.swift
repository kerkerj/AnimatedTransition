//
//  ViewController.swift
//  animation_transitions
//
//  Created by Jerry Huang on 2014/9/21.
//  Copyright (c) 2014年 Jerry Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let transitionManager = TransitionManager()
    var useAnimatedTransition : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pushToNewViewController(sender: UIButton) {
        var testViewController = TestViewController()
//        testViewController.storyboard?.instantiateViewControllerWithIdentifier("HomeController")
//        self.navigationController?.pushViewController(testViewController, animated: true)
        
        self.presentViewController(testViewController, animated: true, completion: nil)
    }
    
    @IBAction func getSwitchedValue(sender: UISwitch) {
        useAnimatedTransition = sender.on
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leave(sender: UIStoryboardSegue){
        println("leave")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if useAnimatedTransition {
            // this gets a reference to the screen that we're about to transition to
            let toViewController = segue.destinationViewController as UIViewController
            
            // instead of using the default transition animation, we'll ask
            // the segue to use our custom TransitionManager object to manage the transition animation
            toViewController.transitioningDelegate = self.transitionManager
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController == nil ? UIStatusBarStyle.Default : UIStatusBarStyle.LightContent
    }

}

