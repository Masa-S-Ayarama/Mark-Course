//
//  Character.swift
//  Deva-Orc-Fight
//
//  Created by Nas@Mac on 22/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import Foundation

class Character {
    
    // 'private' used for data hiding or encapsulate that we don't want to expose or rewritten data in class.
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    //private var _name: String = "Player"
    
    
    // We can't access private variable directly, so create another var to 'get' the value from private variable then access its value from new created var
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
//    var name: String {
//        get {
//            return _name
//        }
//    }
    
    var isAlive: Bool {
        get {
            if (hp <= 0) {
                return false
            } else {
                return true
            }
        }
    }
    
    
    // Anyway, 'private' variable can be change if pass it via initializer (init()) in class.
    
    init(startingHP: Int, attackPwr: Int) {
        
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        
        self._hp -= attackPwr
        
        return true
    }   
    
}
