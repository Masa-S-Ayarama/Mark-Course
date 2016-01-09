//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Nas@Mac on 2/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?

}
