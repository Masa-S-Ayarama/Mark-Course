//
//  MonsterImg.swift
//  myLittleMonster
//
//  Created by Nas@Mac on 25/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg : UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        // default image when gigapet alive
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var x = 1; x <= 4; x++ {
            
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.5
        self.animationRepeatCount = 0   // infinite
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        // default image when gigapet died
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var x = 1; x <= 5; x++ {
            
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.5
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    
    
}