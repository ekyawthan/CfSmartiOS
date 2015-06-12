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
    
    @IBOutlet weak var surveyStatus: UITextView!

    
    @IBOutlet weak var takeSurvey: MKButton!
    let transition = BubbleTransition()
    
    let settings : Settings = Settings()
    let survey : Survey  = Survey()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        toggleSurveyButton()
        println("\(settings.getDelayCounter())")
        let alarm = SurveyAlarm(alarmTime: NSDate(), unitId: "UUID")
        SurveyAlarmManager.sharedInstance.addAlarm(alarm)
        
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        toggleSurveyButton()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let  controller = segue.destinationViewController as? UIViewController
        {
            controller.modalPresentationStyle = .Custom
            controller.transitioningDelegate = self
            
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.startingPoint = self.view.center
        transition.bubbleColor = UIColor.MKColor.Grey
        transition.transitionMode = .Present
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.bubbleColor = UIColor.MKColor.Grey
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
    
    func toggleSurveyButton() {
        if survey.isSurveyAvailable(){
            surveyStatus.text = "Survey Available"
            takeSurvey.userInteractionEnabled = true
            takeSurvey.setTitle("Take Survey", forState: UIControlState.Normal)
        }else{
            surveyStatus.text = "Survey Not Available, Come Back On Monday"
            takeSurvey.userInteractionEnabled = false
            takeSurvey.setTitle("Stay Healthy", forState: UIControlState.Normal)
        }
    }
    
  
    @IBAction func didClickSignOff(sender: AnyObject) {
        self.settings.setUserLoginStatus(isLogin: false)
        self.settings.setUserId("")
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   
    
    

}
