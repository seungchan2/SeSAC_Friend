//
//  EmailViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

final class EmailViewController: BaseViewController {

    let emailView = AuthCommonView()
    var auth = Auth.shared
    
    override func loadView() {
        view = emailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
        setEmailView()
    }
    
    private func setEmailView() {
        emailView.explainLabel.text = "이메일을 입력해 주세요"
        emailView.subTextLabel.isHidden = false
        emailView.commonTextField.textField.placeholder = "SeSAC@email.com"
    }
}
