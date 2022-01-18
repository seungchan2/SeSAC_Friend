//
//  BaseViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        hierarchy()
        layout()
    }
    
    public func style() {}
    public func hierarchy() {}
    public func layout() {}
}
