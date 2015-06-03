//
//  LoginViewController.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import UIKit
import BubbleTransition

class LoginViewController: UIViewController, PostLoginDelegate, UIViewControllerTransitioningDelegate
{

    @IBOutlet weak var userId: MKTextField!
    @IBOutlet weak var signInButton: MKButton!
    
    let transition = BubbleTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        userId.floatingPlaceholderEnabled = true
        userId.cornerRadius = 1.0
        userId.placeholder = "user id"
        userId.layer.borderColor = UIColor.MKColor.Green.CGColor
        userId.rippleLayerColor = UIColor.MKColor.LightGreen
        userId.tintColor = UIColor.MKColor.LightGreen
        
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.shadowRadius = 5.0
        signInButton.layer.shadowColor = UIColor.blackColor().CGColor
        signInButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? UIViewController {
            controller.transitioningDelegate = self
            controller.modalPresentationStyle = .Custom
        }
    }

   
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = self.view.center
        transition.bubbleColor = UIColor.MKColor.LightGreen
        
        return transition
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = self.view.center
        transition.bubbleColor = UIColor.MKColor.Lime
        return transition
    }

    @IBAction func didClickOnSignIn(sender: AnyObject) {
        
        let id : String = userId.text
        PostLogin(userId: id, delegate: self)
    }
    
    func didSucceedLogin(status: Int) {
        println("succeed call recieved")
        performSegueWithIdentifier("redirectToMainFromLogin", sender: nil)
    }
    func didFailedLogin(status: Int) {
        println("failed call recieved")
    }
}
