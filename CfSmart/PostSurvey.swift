//
//  PostSurvey.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation
import Alamofire



protocol PostSurveyDelegate {
    func didSucceedPostSurvey()
    func didFailedPostSurvey()
}

class PostSurvey {
    
    let delegate : PostSurveyDelegate
    let settings : Settings = Settings()
    
    
    
    init (anslistList : [Int], delegate : PostSurveyDelegate) {
        self.delegate       = delegate
        shouldMakeServerRequest(anslistList)
        
    }
    
    private func shouldMakeServerRequest(answerList : [Int]) {
        let userID : String = settings.getUserId()!
        let delay : Int = settings.getDelayCounter()
        
        let parameter :[String : AnyObject] = [
        
            
            "author": userID,
            "question1": answerList[0],
            "question2": answerList[1],
            "question3": answerList[2],
            "question4": answerList[3],
            "question5": answerList[4],
            "question6": answerList[5],
            "question7": answerList[6],
            "question8": answerList[7],
            "question9": answerList[8],
            "question10": answerList[9],
            "question11": answerList[10],
            "question12": answerList[11],
            "delay_counter": delay
            
        ]
        println("\(parameter)")
        
        
        Alamofire
            .request(.POST, "http://52.7.122.129/survey/", parameters: parameter , encoding:.JSON )
            .responseJSON { (request, response, json, error) in
                if let status =  response?.statusCode {
                    println(status)
                    if status == 201 {
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let surveyDate  = dateFormatter.stringFromDate(NSDate())
                        println(surveyDate)
                        self.settings.setLastSurveyDate(surveyDate)
                        
                        self.delegate.didSucceedPostSurvey()
                    }
                }
                if let error = error {
                    println(error)
                    println(request)
                }
                
            }
        
       
    }
    
    

    
    
}

/*
{
"author": "1000",
"question1": 1,
"question2": 0,
"question3": 1,
"question4": 0,
"question5": 0,
"question6": 1,
"question7": 0,
"question8": 1,
"question9": 0,
"question10": 1,
"question11": 1,
"question12": 0,
"delay_counter": 2
}
*/