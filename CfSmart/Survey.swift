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
        if (getDayOfWeek() == 6){
            return true
            
        }
        return false
    }
   func isOnline() -> Bool {
        return true
    }
    
    func isSurveyTokenToday() -> Bool {
        println("last survey date : \(dayDifferent())")
        println("TOday survey date : \(NSDate())")
        
        return dayDifferent() < 1 ? true : false

        
    }
    func getDayOfWeek()->Int? {
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        println(weekDay)
        return weekDay
    }
    
    
    func dayDifferent() -> Int {
        var calendar: NSCalendar = NSCalendar.currentCalendar()
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDayForDate(settings.getlastSurveyDate())
        let date2 = calendar.startOfDayForDate(NSDate())
        
        let flags = NSCalendarUnit.DayCalendarUnit
        let components = calendar.components(flags, fromDate: date1, toDate: date2, options: nil)
        
         return components.day
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
}
