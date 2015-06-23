//
//  SurveyAlarmManager.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/12/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation
import UIKit


class SurveyAlarmManager {
    
    class var sharedInstance : SurveyAlarmManager {
        struct Static {
            static let instance : SurveyAlarmManager = SurveyAlarmManager()
        }
        return Static.instance
    }
    
    private let ALARM_KEY = "surveyAlarm"
    
    func addAlarm(item : SurveyAlarm) {
        var notification            = UILocalNotification()
        notification.timeZone       = NSTimeZone.defaultTimeZone()
        notification.alertBody      = "Survey available, Click to Take Survey"
        notification.alertAction    = "open"
        notification.fireDate       = item.alarmTime
        notification.repeatInterval         = NSCalendarUnit.WeekCalendarUnit
        notification.soundName              = UILocalNotificationDefaultSoundName
        notification.userInfo               = ["alarmUser" : "cfsmart", "UUID" : item.UUID]
        notification.category               = "SURVEY_ALARM_CATAGORIES"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func scheduleAlarm(item : SurveyAlarm) {
        let counter  = Settings.sharedInstance.getDelayCounter()
        if (counter < 5){
            Settings.sharedInstance.setDelayCounter(counter + 1)
            var notification                = UILocalNotification()
            notification.alertBody          = "Survey available"
            notification.alertAction        = "open"
            notification.fireDate           = NSDate().dateByAddingTimeInterval(30 * 60) // 30 minutes from current time
            notification.soundName          = UILocalNotificationDefaultSoundName
            notification.userInfo           = ["alarmUser" : "cf", "UUID" : "UUID1"]
            notification.category           = "SURVEY_ALARM_CATAGORIES"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
        }
        else {
            Settings.sharedInstance.setDelayCounter(0)
            
        }
    
     
        
    }
  

    func cancelAlarm(item : SurveyAlarm) {
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications as! [UILocalNotification] {
            if (notification.userInfo!["UUID"] as! String == "UUID1"){
                UIApplication.sharedApplication().cancelLocalNotification(notification)
            }
            
        }
    
        
    }
    
}

