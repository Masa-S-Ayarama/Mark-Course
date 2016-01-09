//
//  DragImg.swift
//  myLittleMonster
//
//  Created by Nas@Mac on 25/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation
import UIKit

class DragImg : UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview?.superview)
            // find if position in area of target frame
            if CGRectContainsPoint(target.frame, position) {
                
                    NSNotificationCenter.defaultCenter().postNotificationName("onTargetDrpped", object: nil)
            }
        }
        
        self.center = originalPosition
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}