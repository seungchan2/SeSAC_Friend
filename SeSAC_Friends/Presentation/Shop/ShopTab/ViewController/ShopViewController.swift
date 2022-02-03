//
//  ShopViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/26.
//

import UIKit

import SnapKit
import Then

final class ShopViewController: BaseViewController {
    
    let shopView = ShopView()
    
    var viewControllers: [PageComponentProtocol] = [SeSacCharacterViewController(), SeSacBackgroundViewController()]
    
    override func loadView() {
        self.view = shopView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerViewController()
    }
    
    override func style() {
        view.backgroundColor = .white
    }
    
}

extension ShopViewController {
    private func setContainerViewController() {
        let style = PagerTab.Style.default
        shopView.pagerTab.setup(self, viewControllers: viewControllers, style: style)
    }
}
