//
//  Kimara.swift
//  Deva-Orc-Fight
//
//  Created by Nas@Mac on 23/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation

class Kimara : Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot : [String] {
        return ["Touch Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type : String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        
        if (attackPwr >= IMMUNE_MAX) {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
    
    
    
    
}