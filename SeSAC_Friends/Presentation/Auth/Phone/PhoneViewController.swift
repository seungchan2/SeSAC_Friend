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
        setTextField()
        setAddTarget()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
        setPhoneView()
    }
    
    private func setAddTarget() {
        phoneView.confirmButton.addTarget(self, action: #selector(touchConfirmButton), for: .touchUpInside)
        phoneView.commonTextField.textField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setPhoneView() {
        phoneView.confirmButton.setTitle("인증 문자 받기", for: .normal)
        phoneView.commonTextField.textField.keyboardType = .numberPad
    }

    private func setTextField() {
        phoneView.commonTextField.textField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    private func validatePhoneNumber(text: String) -> Bool {
        let pattern = "^01([0-9])-([0-9]{4})-([0-9]{4})$"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) {
            return true
        } else {
            return false
        }
    }
    
    @objc func touchConfirmButton() {
        auth.phoneNumber = userPhoneNumber
        navigationController?.pushViewController(MessageViewController.instanceFromNib(), animated: true)
     }
    
    @objc func phoneNumberTextFieldDidChange(_ textField: UITextField) {
        phoneView.commonTextField.setupMode(mode: .input)
        
        guard let phoneNumber = phoneView.commonTextField.textField.text else { return }

        textField.text = (textField.text ?? "").pretty()
     
        if phoneNumber.count < 1 {
            phoneView.commonTextField.setupMode(mode: .inactive)
            phoneView.confirmButton.setupMode(mode: .inactive)
        } else {
            if validatePhoneNumber(text: phoneNumber) {
                phoneView.commonTextField.setupMode(mode: .active)
                phoneView.confirmButton.setupMode(mode: .active)
            } else {
                phoneView.commonTextField.setupMode(mode: .inactive)
                phoneView.confirmButton.setupMode(mode: .inactive)
            }
        }
        let krPhoneNumber = "+82" + phoneNumber.replacingOccurrences(of: "-", with: "")
        userPhoneNumber = krPhoneNumber
    }
}

extension String {
    func pretty() -> String {
        let string = self.replacingOccurrences(of: "-", with: "")
        let array = Array(string)
        if array.count > 3 {
            if let regex = try? NSRegularExpression(pattern: "([0-9]{3})([0-9]{4})([0-9]{4})", options: .caseInsensitive) {
                let modString = regex.stringByReplacingMatches(in: string, options: [], range: NSRange(string.startIndex..., in: string), withTemplate: "$1-$2-$3")
                return modString
            }
        }
        return self
    }
}
