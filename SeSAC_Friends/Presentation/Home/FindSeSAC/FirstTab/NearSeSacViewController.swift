//
//  NearSeSacViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class NearSeSacViewController: BaseViewController {
    
    let commonView = CommonFindSeSacView()
    
    override func loadView() {
        self.view = commonView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func style() {
        super.style()
        view.backgroundColor = .white
    }
}

extension NearSeSacViewController: PageComponentProtocol {
    var pageTitle: String { "주변 새싹" }
}
