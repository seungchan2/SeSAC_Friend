//
//  FindSeSacViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class FindSeSACViewController: BaseViewController {
    
    let findSeSACView = FindSeSACView()
    var viewControllers: [PageComponentProtocol] = [NearSeSacViewController(), GetRequestViewController()]
    
    override func loadView() {
        view = findSeSACView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerViewController()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
}

extension FindSeSACViewController {
    private func setContainerViewController() {
        let style = PagerTab.Style.default
        findSeSACView.pagerTab.setup(self, viewControllers: viewControllers, style: style)
    }
}
