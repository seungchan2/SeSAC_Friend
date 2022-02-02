//
//  FindSeSacViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class FindSeSacViewController: BaseViewController {
    
    @IBOutlet weak var pagerTab: PagerTab!
    
    var viewControllers: [PageComponentProtocol] = [NearSeSacViewController(), GetRequestViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerViewController()
    }
}

extension FindSeSacViewController {
    private func setContainerViewController() {
        let style = PagerTab.Style.default
        pagerTab.setup(self, viewControllers: viewControllers, style: style)
    }
}
