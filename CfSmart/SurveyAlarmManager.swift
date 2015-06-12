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
    
        var notification                = UILocalNotification()
        notification.alertBody          = "Survey available"
        notification.alertAction        = "open"
        notification.fireDate           = NSDate().dateByAddingTimeInterval(30) // 30 minutes from current time
        notification.soundName          = UILocalNotificationDefaultSoundName
        notification.userInfo           = ["alarmUser" : "cf", "UUID" : "UUID1"]
        notification.category           = "SURVEY_ALARM_CATAGORIES"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    /*
func scheduleReminderforItem(item: TodoItem) {
var notification = UILocalNotification() // create a new reminder notification
notification.alertBody = "Reminder: Todo Item \"\(item.title)\" Is Overdue" // text that will be displayed in the notification
notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
notification.fireDate = NSDate().dateByAddingTimeInterval(30) // 30 minutes from current time
notification.soundName = UILocalNotificationDefaultSoundName // play default sound
notification.userInfo = ["title": item.title, "UUID": item.UUID] // assign a unique identifier to the notification that we can use to retrieve it later
notification.category = "TODO_CATEGORY"

UIApplication.sharedApplication().scheduleLocalNotification(notification)
}
*/

    func cancelAlarm(item : SurveyAlarm) {
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications as! [UILocalNotification] {
            if (notification.userInfo!["UUID"] as! String == "UUID1"){
                UIApplication.sharedApplication().cancelLocalNotification(notification)
            }
            
        }
    
        
    }
    
}

