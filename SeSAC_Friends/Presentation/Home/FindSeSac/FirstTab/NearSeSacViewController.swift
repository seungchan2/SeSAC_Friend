//
//  NearSeSacViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class NearSeSacViewController: BaseViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func style() {
        super.style()
        view.backgroundColor = .red
    }
}

extension NearSeSacViewController: PageComponentProtocol {
    var pageTitle: String { "주변 새싹" }
}
