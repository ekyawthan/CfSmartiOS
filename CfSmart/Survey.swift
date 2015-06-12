//
//  Survey.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/7/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation


class Survey {
    
    let settings : Settings = Settings()
    
    func isSurveyAvailable() -> Bool {
        if (self.isOnline()){
            if(self.isTodayIsMonday()) {
                if (!isSurveyTokenToday()) {
                    return true
                    
                }
                
            }
            
        }
        return false
    }
    
    
    func isTodayIsMonday() -> Bool {
        if (getDayOfWeek() == 2){
            return true
            
        }
        return false
    }
   func isOnline() -> Bool {
        return false
    }
    
    func isSurveyTokenToday() -> Bool {
        if(settings.getlastSurveyDate().isEqualToDate(NSDate())){
            return true
        }
        
        return false
    }
    func getDayOfWeek()->Int? {
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        println(weekDay)
        return weekDay
    }
}
