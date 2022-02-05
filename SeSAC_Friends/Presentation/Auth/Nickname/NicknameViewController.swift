//
//  NicknameViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

final class NicknameViewController: BaseViewController {

    let nicknameView = AuthCommonView()
    var auth = Auth.shared
    var userNickname = String()
    
    override func loadView() {
        view = nicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        checkNicknameTextField()
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
    
    private func setAddTarget() {
        nicknameView.backButton.addTarget(self, action: #selector(touchBackButton), for: .touchUpInside)
        nicknameView.confirmButton.addTarget(self, action: #selector(touchConfirmButton), for: .touchUpInside)
    }
    
    private func checkNicknameTextField() {
        nicknameView.commonTextField.textField.addTarget(self, action: #selector(nicknameTextFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    private func checkValidateNickName(nickname: String) -> Bool {
        let nicknameRegEx = "[가-힣]{1,10}"
        let nicknameTest = NSPredicate(format: "SELF MATCHES %@", nicknameRegEx)
        return nicknameTest.evaluate(with: nickname)
    }
    
    private func validNickname() {
        nicknameView.commonTextField.setupMode(mode: .active)
        nicknameView.confirmButton.setupMode(mode: .active)
    }
    
    private func inValidNickname() {
        nicknameView.commonTextField.setupMode(mode: .inactive)
        nicknameView.confirmButton.setupMode(mode: .inactive)
    }
    
    @objc func touchBackButton() {
        navigationController?.popViewController(animated: true)
     }
    
    @objc func touchConfirmButton() {
        auth.nickname = userNickname
        navigationController?.pushViewController(EmailViewController.instanceFromNib(), animated: true)
     }
    
    @objc func nicknameTextFieldDidChange(_ textField: UITextField) {
        guard let nickname = nicknameView.commonTextField.textField.text else { return }
        
        if nickname.count < 11 {
            if !checkValidateNickName(nickname: nickname) {
              inValidNickname()
            } else {
            validNickname()
            }
        } else {
           inValidNickname()
        }
        
        userNickname = nickname
    }
}
