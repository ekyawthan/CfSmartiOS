//
//  SurveyAlarm.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/12/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation


struct  SurveyAlarm {
    
    var alarmTime               : NSDate
    var UUID                    : String
    
    init(alarmTime : NSDate, unitId : String){
        self.alarmTime  = alarmTime
        self.UUID       = unitId
    }
    
    
    
}