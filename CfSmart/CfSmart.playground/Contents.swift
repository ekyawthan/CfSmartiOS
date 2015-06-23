//: Playground - noun: a place where people can play

import Cocoa

let now : NSDate = NSDate()

let cal = NSCalendar.currentCalendar()
let components = cal.components(.CalendarUnitHour | .CalendarUnitMinute  | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: now)
components.weekday = 2
components.hour = 12
components.minute = 0
components.second = 0
cal.dateFromComponents(components)



/*
NSDate *now = [NSDate date];
NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit fromDate:now];

NSUInteger weekdayToday = [components weekday];
NSInteger daysToMonday = (9 - weekdayToday) % 7;

NSDate *nextMonday = [now dateByAddingTimeInterval:60*60*24*daysToMonday];
*/

//let now : NSDate = NSDate()
//let calendar : NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: now)
//let weekday : Int = components.weekday
//println(weekday)
//let daysToMonday : Int = (9 - weekday) % 7
//let nextMonday : NSDate = now.dateByAddingTimeInterval(60 * 60 * 24 *daysToMonday)






