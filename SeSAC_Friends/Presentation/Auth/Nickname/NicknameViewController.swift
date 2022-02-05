//
//  NicknameViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

final class NicknameViewController: BaseViewController {

    let nicknameView = AuthCommonView()
    
    override func loadView() {
        view = nicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
        setNicknameView()
    }
    
    private func setNicknameView() {
        nicknameView.explainLabel.text = "닉네임을 입력해주세요"
        nicknameView.commonTextField.textField.placeholder = "10자 이내로 입력"
    }
}
