//
//  PhoneViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

import AnyFormatKit

final class PhoneViewController: BaseViewController {

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
        
        if phoneNumber.count > 1 {
            phoneBottomView.backgroundColor = UIColor.black
            
        } else {
            phoneBottomView.backgroundColor = Color.sesacGray3
            confirmButton.backgroundColor = Color.sesacGray6
            confirmButton.setTitleColor(Color.sesacGray3, for: .normal)
        }
    }
}

extension PhoneViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        confirmButton.backgroundColor = Color.sesacGreen
        phoneBottomView.backgroundColor = Color.sesacGray3
        confirmButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = phoneNumberTextField.text else {
            return true
        }

        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return true
        }

        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        phoneNumberTextField.text = result.formattedText
        let position = phoneNumberTextField.position(from: phoneNumberTextField.beginningOfDocument, offset: result.caretBeginOffset)!
        phoneNumberTextField.selectedTextRange = phoneNumberTextField.textRange(from: position, to: position)
        return false
    }
}
