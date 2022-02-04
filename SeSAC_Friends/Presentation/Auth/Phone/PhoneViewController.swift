//
//  PhoneViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

final class PhoneViewController: BaseViewController {
    
    // Singleton Pattern
    var auth = Auth.shared
    // 변환된 전화번호 값을 저장하는 변수
    var userPhoneNumber = String()
    
    let phoneView = AuthCommonView()
    
    override func loadView() {
        view = phoneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        setTextField()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
        setPhoneView()
    }
    
    private func setPhoneView() {
        phoneView.confirmButton.setTitle("인증 문자 받기", for: .normal)
    }
    
    private func assignDelegate() {
        phoneView.commonTextField.textField.delegate = self
    }
    
    private func setTextField() {
        phoneView.commonTextField.textField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    @objc func phoneNumberTextFieldDidChange(_ textField: UITextField) {
        guard let phoneNumber = phoneView.commonTextField.textField.text else { return }
        
        let krPhoneNumber = "+82" + phoneNumber.replacingOccurrences(of: "-", with: "")
        
        userPhoneNumber = krPhoneNumber
    }
}

extension PhoneViewController: UITextFieldDelegate {
    
}
