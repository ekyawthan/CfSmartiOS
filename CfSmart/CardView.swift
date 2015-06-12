//
//  CardView.swift
//  CfSmart
//
//  Created by Kyaw Than Mong on 6/4/15.
//  Copyright (c) 2015 meeratech. Inc. All rights reserved.
//

import UIKit

class CardView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var radius : CGFloat = 2
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = radius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.whiteColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowPath = shadowPath.CGPath
        
    }

}
