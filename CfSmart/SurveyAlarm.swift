//
//  SurveyAlarm.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/12/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation

enum Day : Int {
    case SUNDAY = 1
    case MONDAY
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case SATURDAY
    
}


struct  SurveyAlarm {
    
    var alarmTime               : NSDate
    var UUID                    : String
    
    init(alarmTime : NSDate, unitId : String){
        self.alarmTime  = alarmTime
        self.UUID       = unitId
    }
    
   
       
        
        
    }
    /*
NSDate *today = [NSDate date];
NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
[gregorian setLocale:[NSLocale currentLocale]];

NSDateComponents *nowComponents = [gregorian components:NSYearCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];

[nowComponents setWeekday:2]; //Monday
[nowComponents setWeek: [nowComponents week] + 1]; //Next week
[nowComponents setHour:8]; //8a.m.
[nowComponents setMinute:0];
[nowComponents setSecond:0];

NSDate *beginningOfWeek = [gregorian dateFromComponents:nowComponents];
Now that you have the new NSDate, you can calculate the difference between
*/

