
//
//  SurveyViewController.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import UIKit

class SurveyViewController:
    UIViewController,
    PostSurveyDelegate
{
    @IBOutlet weak var yesButton: MKButton!
    @IBOutlet weak var noButton: MKButton!
    
    @IBOutlet weak var quesiton: UILabel!
    @IBOutlet weak var currentStatus: UILabel!
    
    let settings : Settings = Settings()
    var collectedAnswer : [Int]  = [Int]()
    
    let SurveyQuestions : [String]  =  [
    "In the past week have you had a change in sputum volume or colour?",
    "In the past week have you had new or increased blood in your sputum?",
    "In the past week have you had increased cough?",
    "In the past week have you had increased wheeze?",
    "In the past week have you had increased shortness of breath?",
    "In the past week have you had increased fatigue or lethargy?",
    "In the past week have you had a fever?",
    "In the past week have you had a loss of appetite or weight?",
    "In the past week have you had sinus pain or tenderness?",
    "In the past week have you had new or increased chest pain?",
    "In the past week have you felt low in mood?",
    "In the past week have felt worried?"
    
    
    ]
    
    var counter : Int = 0 {
        didSet {
            quesiton.text = SurveyQuestions[counter]
            currentStatus.text = "Question \(counter + 1) of 12 "
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quesiton.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        quesiton.numberOfLines = 0
        setupMKButton(noButton)
        setupMKButton(yesButton)
        yesButton.userInteractionEnabled = true
        noButton.userInteractionEnabled = true
        println("the size of questions : \(SurveyQuestions.count)")
        quesiton.userInteractionEnabled = false
        quesiton.text = SurveyQuestions[0]
        self.noButton.tag = 10
        self.noButton.addTarget(self, action: "didAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.yesButton.tag = 20
        self.yesButton.addTarget(self, action: "didAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        

    }
    
    private func setupMKButton(button : MKButton) {
        button.cornerRadius = 40.0
        button.backgroundLayerCornerRadius = 40.0
        button.maskEnabled = false
        button.ripplePercent = 1.75
        button.rippleLocation = .Center
        
    }
    
    
    func didAnswer(button : MKButton) {
        if (button.tag == 10){
            collectedAnswer.append(0)
        }
        else {
            collectedAnswer.append(1)
            
        }
        
        if(counter > 10){
            
            yesButton.userInteractionEnabled = false
            noButton.userInteractionEnabled = false
         
            PostSurvey(anslistList: collectedAnswer, delegate: self)
            return
            
        }
        else
        {
            counter = counter + 1

        }
    }
    
    
    // delegate confirmation 
    
    func didSucceedPostSurvey() {
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func didFailedPostSurvey() {
        
    }

   

}
