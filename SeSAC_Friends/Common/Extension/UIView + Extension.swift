//
//  UIView + Extension.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

extension UIView {
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5.0
    }
    
    func makeRoundedSpecificCorner(firstCorner: CACornerMask.Element, secondCorner: CACornerMask.Element) {
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = CACornerMask(arrayLiteral: firstCorner, secondCorner)
    }
}
