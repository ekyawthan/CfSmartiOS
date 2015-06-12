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
    
    
    @IBOutlet weak var takeSurveyButton: UIButton! {
        didSet {
            
        }
        
    }
    let transition = BubbleTransition()
    
    let settings : Settings = Settings()
    let survey : Survey  = Survey()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        takeSurveyButton.addTarget(self, action: "toggleSurvey", forControlEvents: UIControlEvents.TouchUpInside)
        setNotification()
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       // setNotification()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let  controller = segue.destinationViewController as? UIViewContler
//        {
//            controller.modalPresentationStyle = .Custom
//            controller.transitioningDelegate = self
//            
//        }
//    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.startingPoint = self.view.center
        transition.bubbleColor = UIColor.MKColor.Grey
        transition.transitionMode = .Present
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.bubbleColor = UIColor.MKColor.Purple
        transition.transitionMode = .Dismiss
        transition.startingPoint = self.view.center
        return transition
    }
    
    
    
    func setNotification() {
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    private func toggleSurvey(){
        
        if survey.isSurveyAvailable() {
            takeSurveyButton.titleLabel?.text = "Take Survey"
            self.performSegueWithIdentifier("toSurveyView", sender: self)
            
        }
        else
        {
            takeSurveyButton.titleLabel?.text = "Come back On Monday"
        }
        
    
    
    }
    
    
    
    

}
