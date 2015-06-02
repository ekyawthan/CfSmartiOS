//
//  PostLogin.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation


protocol PostLoginDelegate
{
    func didSucceedLogin(status : Int)
    func didFailedLogin(status : Int)
}

class PostLogin {
    
    var delegate : PostLoginDelegate
    
    init(userId : String, delegate : PostLoginDelegate){
        self.delegate = delegate
        
    }
}
