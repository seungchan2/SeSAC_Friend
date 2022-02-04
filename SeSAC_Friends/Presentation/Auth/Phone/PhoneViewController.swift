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
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var phoneBottomView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        setTextField()
    }

    override func style() {
        confirmButton.makeRounded(radius: 8)
    }
    
    private func assignDelegate() {
        phoneNumberTextField.delegate = self
    }
    
    private func setTextField() {
        phoneNumberTextField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    @objc func phoneNumberTextFieldDidChange(_ textField: UITextField) {
        guard let phoneNumber = phoneNumberTextField.text else { return }
        
        let krPhoneNumber = "+82" + phoneNumber.replacingOccurrences(of: "-", with: "")
        
        userPhoneNumber = krPhoneNumber
        
        if phoneNumber.count > 1 {
            phoneBottomView.backgroundColor = UIColor.black
            
        } else {
            phoneBottomView.backgroundColor = Color.sesacGray3
            confirmButton.backgroundColor = Color.sesacGray6
            confirmButton.setTitleColor(Color.sesacGray3, for: .normal)
        }
    }
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        auth.phoneNumber = userPhoneNumber
        navigationController?.pushViewController(MessageViewController.instanceFromNib(), animated: true)
        print("1")
        
    }
}

extension PhoneViewController: UITextFieldDelegate {
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        guard let text = phoneNumberTextField.text else {
//            return true
//        }
//
//        let characterSet = CharacterSet(charactersIn: string)
//        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
//            return true
//        }
//
//        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
//        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
//        phoneNumberTextField.text = result.formattedText
//        let position = phoneNumberTextField.position(from: phoneNumberTextField.beginningOfDocument, offset: result.caretBeginOffset)!
//        phoneNumberTextField.selectedTextRange = phoneNumberTextField.textRange(from: position, to: position)
//        return false
//    }
}
