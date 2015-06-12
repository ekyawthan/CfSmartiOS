//
//  AppDelegate.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /*
let todoCategory = UIMutableUserNotificationCategory() // notification categories allow us to create groups of actions that we can associate with a notification
todoCategory.identifier = "TODO_CATEGORY"
todoCategory.setActions([remindAction, completeAction], forContext: .Default) // UIUserNotificationActionContext.Default (4 actions max)
todoCategory.setActions([completeAction, remindAction], forContext: .Minimal) // UIUserNotificationActionContext.Minimal - for when space is limited (2 actions max)

application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: NSSet(array: [todoCategory]) as Set<NSObject>)) //
*/


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        
//        let completeAction = UIMutableUserNotificationAction()
//        completeAction.identifier = "COMPLETE_SURVEY"
//        completeAction.title = "Aleady Took"
//        completeAction.activationMode = .Background
//        
//        completeAction.authenticationRequired = false
//        completeAction.destructive = true
        
        let snoozeAction = UIMutableUserNotificationAction()
        snoozeAction.identifier = "SNOOZE"
        snoozeAction.title = "Snooze 30 min"
        snoozeAction.activationMode = .Background
        snoozeAction.destructive = false
        let alarmCategory = UIMutableUserNotificationCategory()
        alarmCategory.identifier = "SURVEY_ALARM_CATAGORIES"
        alarmCategory.setActions([snoozeAction], forContext: .Default)
        alarmCategory.setActions([snoozeAction], forContext: .Minimal)
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: NSSet(array: [alarmCategory]) as Set<NSObject>))
        return true
    }

    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        var alarm = SurveyAlarm(alarmTime: notification.fireDate!, unitId: notification.userInfo!["UUID"] as! String)
        switch (identifier!) {
            case "COMPLETE_SURVEY":
                
                SurveyAlarmManager.sharedInstance.cancelAlarm(alarm)
                
            break
            case "SNOOZE":
                SurveyAlarmManager.sharedInstance.scheduleAlarm(alarm)
            break
            
        default :
            break
        }
        completionHandler()
    }


}

