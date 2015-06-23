//
//  Survey.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/7/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation


class Survey {
    
    func isSurveyAvailable() -> Bool {
        if (self.isOnline()){
            println("online")
            if(self.isTodayIsMonday()) {
                println("yes , its the day")
                if (!isSurveyTokenToday()) {
                    println("survey not taken yet")
                    return true
                    
                }
                
            }
            
        }
        return false
    }
    
    
    func isTodayIsMonday() -> Bool {
//        if (getDayOfWeek() == 2){
//            return true
//            
//        }
        return true
    }
   func isOnline() -> Bool {
        return true
    }
    
    func isSurveyTokenToday() -> Bool {
        
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
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let start  = dateFormatter.stringFromDate(NSDate())
        let end = Settings.sharedInstance.getlastSurveyDate()!
        
         return test(end, end: start)
    }
    
    
    func test(start :String, end : String) -> Int {
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let startDate:NSDate = dateFormatter.dateFromString(start)!
        let endDate:NSDate = dateFormatter.dateFromString(end)!
        
        let cal = NSCalendar.currentCalendar()
        let now : String = dateFormatter.stringFromDate(NSDate())
        println(now)
        
        
        let unit:NSCalendarUnit = .CalendarUnitDay
        
        let components = cal.components(unit, fromDate: startDate, toDate: endDate, options: nil)
        
        println("The day diff from test :\(components.day)")
        return components.day
        

    }
    
    func wantedDay(day : Day) -> NSDate? {
        let dayInt  = day.rawValue
        println("Raw value of monday  : \(dayInt)")
        let today : NSDate = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        if let  comp = cal?.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.WeekdayCalendarUnit | NSCalendarUnit.WeekCalendarUnit | NSCalendarUnit.HourCalendarUnit | NSCalendarUnit.MinuteCalendarUnit | NSCalendarUnit.SecondCalendarUnit | NSCalendarUnit.WeekOfYearCalendarUnit, fromDate: today) {
           
            
            comp.weekday = dayInt as Int
            println("\(comp.weekOfYear)")
            comp.weekOfYear = comp.weekOfYear + 1
            comp.hour = 12
            
            comp.minute = 0
            comp.second = 0
            

            return cal?.dateFromComponents(comp)
            
        }
        
        return NSDate()
    }
    
    
    
}
