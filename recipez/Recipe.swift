//
//  Recipe.swift
//  recipez
//
//  Created by Nas@Mac on 2/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setRecipeImg(img: UIImage) {
        
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }

    func getRecipeImg() -> UIImage {
        
        let img = UIImage(data: self.image!)!
        return img
    }
    
    
    
    
    
}
