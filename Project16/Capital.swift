//
//  Capital.swift
//  Project16
//
//  Created by Ali Karababa on 1.04.2021.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title : String?
    var coordinate : CLLocationCoordinate2D
    var info : String
    var image : String
    
    init(title : String, coordinate : CLLocationCoordinate2D, info : String, image: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.image = image
    }
}
