//
//  Person.swift
//  defaults-are-fun
//
//  Created by Nas@Mac on 1/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation

class Person : NSObject, NSCoding {
    
    var firstName: String!
    var lastName: String!
    
    init(first: String, last: String) {
        
        firstName = first
        lastName = last
    }
    
    override init() {
        
    }
    
    // Call saved data
    // When NSUerDefaults was called this function will be called automatically
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    // Saved data to disk
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
}
