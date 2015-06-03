//
//  MainViewController.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import UIKit
import BubbleTransition

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate
{
    
    let transition = BubbleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let  controller = segue.destinationViewController as? UIViewController {
            controller.modalPresentationStyle = .Custom
            controller.transitioningDelegate = self
            
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.startingPoint = self.view.center
        transition.bubbleColor = UIColor.MKColor.Purple
        transition.transitionMode = .Present
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.bubbleColor = UIColor.MKColor.Purple
        transition.transitionMode = .Dismiss
        transition.startingPoint = self.view.center
        return transition
    }

}
