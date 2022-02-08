//
//  GetRequestViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class GetRequestViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func style() {
        super.style()
        view.backgroundColor = .gray
    }
}

extension GetRequestViewController: PageComponentProtocol {
    var pageTitle: String { "받은 요청" }
}

