//
//  MessageViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

final class MessageViewController: BaseViewController {
   
    let messageView = MessageView()
    var auth = Auth.shared
    
    override func loadView() {
        view = messageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(auth.phoneNumber)
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
}
