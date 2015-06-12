//
//  Settings.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation

 let UserLoginStatus = "loginStatus"
 let UserId = "userID"
 let delayCounter = "delayCounter"
 let LastSurveyDate = "lastSurveyDate"

class Settings {
    let settings = NSUserDefaults()
    
    // user login status
    
    func isUserLogin()->Bool                            { return settings.boolForKey(UserLoginStatus)}
    func setUserLoginStatus(#isLogin:Bool)              { settings.setObject(isLogin, forKey: UserLoginStatus)}
    
    func setUserId(userId : String)                     { settings.setObject(userId, forKey: UserId)}
    func getUserId() -> String?                         { return settings.stringForKey(UserId)}
    
    func setDelayCounter(counter : Int)                 { settings.setInteger(counter, forKey: delayCounter)}
    func getDelayCounter () -> Int                      { return settings.integerForKey(delayCounter)}
    
    func setLastSurveyDate(date : NSDate )              { settings.setObject(date, forKey: LastSurveyDate)}
    
    func getlastSurveyDate() -> NSDate                  {
        if let lastSurveyDate: AnyObject = settings.objectForKey(LastSurveyDate){
            return (lastSurveyDate as? NSDate)!
        }
        return NSDate()
    }
    

    
    func reset(){
        if let appDomain : NSString = NSBundle.mainBundle().bundleIdentifier {
            println("deleting Settings of  \(appDomain)")
            self.settings.removePersistentDomainForName(appDomain as String)
        }
    }
    
    }