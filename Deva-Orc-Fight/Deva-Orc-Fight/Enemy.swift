//
//  Enemy.swift
//  Deva-Orc-Fight
//
//  Created by Nas@Mac on 23/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation

class Enemy : Character {
    
    
    var loot : [String] {
        return ["Rasty Dagger", "Cracked Bugler"]
    }
    
    var type : String {
        return "Grunt"
    }
    
    
    // there can be both dropped or not dropped loot, so use optional type
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            
            return loot[rand]
        }
        
        return nil
    }
   
}
