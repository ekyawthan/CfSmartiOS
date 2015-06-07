//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let date : NSDate = NSDate()
let defualt = NSUserDefaults()
defualt.setObject(date, forKey: "testDay")
defualt.objectForKey("testDay")


