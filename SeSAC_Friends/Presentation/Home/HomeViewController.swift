//
//  HomeViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

final class HomeViewController: BaseViewController {

    let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    

}
