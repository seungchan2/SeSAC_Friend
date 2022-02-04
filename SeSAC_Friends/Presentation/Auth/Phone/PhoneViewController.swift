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
    
    let phoneView = PhoneView()
    
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
    }
    
    private func assignDelegate() {
        phoneView.phoneNumberTextField.textField.delegate = self
    }
    
    private func setTextField() {
        phoneView.phoneNumberTextField.textField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    @objc func phoneNumberTextFieldDidChange(_ textField: UITextField) {
        guard let phoneNumber = phoneView.phoneNumberTextField.textField.text else { return }
        
        let krPhoneNumber = "+82" + phoneNumber.replacingOccurrences(of: "-", with: "")
        
        userPhoneNumber = krPhoneNumber
    }
}

extension PhoneViewController: UITextFieldDelegate {
    
}
