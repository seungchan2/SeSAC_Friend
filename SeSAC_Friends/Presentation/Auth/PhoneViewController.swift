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
    @IBOutlet weak var phoneBottonView: UIView!
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
        
        guard let count = phoneNumberTextField.text?.count else { return }
        if count > 0 {
            phoneBottonView.backgroundColor = UIColor.black
            print("222")
        } else {
            phoneBottonView.backgroundColor = UIColor.gray
            print("333")
        }
        
        print("1")
        

        
    }


}


// ###=####=#### 형식
extension PhoneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = phoneNumberTextField.text else {
            return false
        }
        
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }

        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        phoneNumberTextField.text = result.formattedText
        let position = phoneNumberTextField.position(from: phoneNumberTextField.beginningOfDocument, offset: result.caretBeginOffset)!
        phoneNumberTextField.selectedTextRange = phoneNumberTextField.textRange(from: position, to: position)
        return false
    }
}
