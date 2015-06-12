//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let date : NSDate = NSDate()
let defualt = NSUserDefaults()
defualt.objectForKey("testDay")

defualt.objectForKey("testDay")

func getDayOfWeek()->Int? {
    let todayDate = NSDate()
    let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
    let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
    let weekDay = myComponents?.weekday
    return weekDay
}

getDayOfWeek()

