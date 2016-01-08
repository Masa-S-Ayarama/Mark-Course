//
//  DevilWizard.swift
//  Deva-Orc-Fight
//
//  Created by Nas@Mac on 23/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation

class DevilWizard : Enemy {
    
    override var loot : [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type : String {
        return "Devil Wizard"
    }
}