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
    

    
    @IBOutlet weak var surveyStatus: UILabel!
    @IBOutlet weak var takeSurvey: MKButton!
    let transition = BubbleTransition()
    
    let settings : Settings = Settings()
    let survey : Survey  = Survey()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        surveyStatus.lineBreakMode = NSLineBreakMode.ByWordWrapping
        surveyStatus.numberOfLines = 0
        toggleSurveyButton()
        let now : NSDate = NSDate()
        let calendar : NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: now)
       
        let weekday         : Int = components.weekday
        let daysToMonday    : Int = (9 - weekday) % 7
        let wait            : NSTimeInterval = NSTimeInterval(daysToMonday)
        let nextMonday      : NSDate = now.dateByAddingTimeInterval(60 * 60 * 24 * wait )
        let cal             : NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

        let comp = cal.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: nextMonday)
        comp.hour = 12
        comp.minute = 0
        comp.second = 0
        let fireTime : NSDate = calendar.dateFromComponents(components)!
        println(fireTime)
        
        println(nextMonday)
        
        
        let alarm = SurveyAlarm(alarmTime: survey.wantedDay(.MONDAY)!, unitId: "UUID")
       SurveyAlarmManager.sharedInstance.addAlarm(alarm)
  

        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        toggleSurveyButton()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        toggleSurveyButton()
       
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
            surveyStatus.text = ""
            takeSurvey.userInteractionEnabled = true
            takeSurvey.backgroundColor = UIColor.blueColor()
            takeSurvey.setTitle("Begin Questionnaire", forState: UIControlState.Normal)
        }else{
            surveyStatus.lineBreakMode = .ByWordWrapping
            surveyStatus.numberOfLines = 0
            surveyStatus.text = "Thank you for completing this questionnaire"
            takeSurvey.userInteractionEnabled = false
            takeSurvey.backgroundColor = UIColor.clearColor()
            takeSurvey.setTitle("", forState: UIControlState.Normal)
        }
    }
    
  
    @IBAction func didClickSignOff(sender: AnyObject) {
        self.settings.setUserLoginStatus(isLogin: false)
        self.settings.setUserId("")
        Settings.sharedInstance.reset()
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
