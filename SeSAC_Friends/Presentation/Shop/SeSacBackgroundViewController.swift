//
//  SeSacBackgroundViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

final class SeSacBackgroundViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }

}

extension SeSacBackgroundViewController: PageComponentProtocol {
    var pageTitle: String { "배경" }
}
