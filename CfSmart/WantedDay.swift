//
//  WantedDay.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/16/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation


class WantedDay {
 
    class func wantedDay () -> NSDate {
        let wantedWeekDay : Int  = 2
        
        
        
        


        return NSDate()
    }
}

/*
//create new component to get weekday of first date
NSDateComponents *newcomponents = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSCalendarUnitWeekday fromDate:firstDateOfCurMonth];
NSInteger firstDateWeekDay = newcomponents.weekday;
NSLog(@"weekday : %li",(long)firstDateWeekDay);

//get last month date
NSInteger curMonth = newcomponents.month;
[newcomponents setMonth:curMonth+1];

NSDate * templastDateOfCurMonth = [[gregorianCalendar dateFromComponents:newcomponents] dateByAddingTimeInterval: -1]; // One second before the start of next month

NSDateComponents *lastcomponents = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSCalendarUnitWeekday fromDate:templastDateOfCurMonth];

[lastcomponents setHour:0];
[lastcomponents setMinute:0];
[lastcomponents setSecond:0];

NSDate *lastDateOfCurMonth = [gregorianCalendar dateFromComponents:lastcomponents];

NSLog(@"%@",lastDateOfCurMonth);

NSMutableArray *mutArrDates = [NSMutableArray array];

NSDateComponents *dayDifference = [NSDateComponents new];
[dayDifference setCalendar:gregorianCalendar];

//get wanted weekday date
NSDate *firstWeekDateOfCurMonth = nil;
if (wantedWeekDay == firstDateWeekDay) {
    firstWeekDateOfCurMonth = firstDateOfCurMonth;
}
else
{
    NSInteger day = wantedWeekDay - firstDateWeekDay;
    if (day < 0)
    day += 7;
    ++day;
    [components setDay:day];
    
    firstWeekDateOfCurMonth = [gregorianCalendar dateFromComponents:components];
}

NSLog(@"%@",firstWeekDateOfCurMonth);

NSUInteger weekOffset = 0;
NSDate *nextDate = firstWeekDateOfCurMonth;

do {
    [mutArrDates addObject:nextDate];
    [dayDifference setWeekOfYear:++weekOffset];
    NSDate *date = [gregorianCalendar dateByAddingComponents:dayDifference toDate:firstWeekDateOfCurMonth options:0];
    nextDate = date;
} while([nextDate compare:lastDateOfCurMonth] == NSOrderedAscending || [nextDate compare:lastDateOfCurMonth] == NSOrderedSame);

NSLog(@"%@",mutArrDates);
*/

