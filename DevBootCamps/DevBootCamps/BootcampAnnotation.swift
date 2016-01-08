//
//  BootcampAnnotation.swift
//  DevBootCamps
//
//  Created by Nas@Mac on 2/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import MapKit


class BootcampAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    
    
}
