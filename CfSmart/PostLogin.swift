//
//  PostLogin.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/1/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import Foundation
import Alamofire


protocol PostLoginDelegate
{
    func didSucceedLogin(status : Int)
    func didFailedLogin(status : Int)
}

class PostLogin {
    
    var delegate : PostLoginDelegate
    
    init(userId : String, delegate : PostLoginDelegate){
        self.delegate = delegate
        shouldMakeLoginRequest(userId)
        
    }
    
    private func shouldMakeLoginRequest(userId : String){
        
        Alamofire
        .request(.GET, "http://52.7.122.129/user/\(userId)/" )
        .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
            self.delegate.didSucceedLogin(12)
            if let res = response{
                println(res.statusCode)
                if (res.statusCode == 200){
                    self.delegate.didSucceedLogin(res.statusCode)
                }
                
                
            }
        }
    }
}

        