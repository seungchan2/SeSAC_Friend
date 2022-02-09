//
//  AnnotationStyle.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/09.
//

import UIKit

import SnapKit
import MapKit

enum AnnotationMode {
    case mapMarker
    case green
    case purple
    case lightGreen
    case yellow
}

class CustomAnnotationView: MKAnnotationView {
    
    static let identifier = "CustomAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var mode: AnnotationMode
    var title: String?
    
    init(coor: CLLocationCoordinate2D, mode: AnnotationMode) {
        self.coordinate = coor
        self.mode = mode
    }
    
}
