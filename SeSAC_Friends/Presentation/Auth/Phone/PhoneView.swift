//
//  PhoneView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

class PhoneView: UIView, Representable {
    
    let explainLabel = UILabel().then {
        $0.text = "새싹 서비스 이용을 위해\n휴대폰 번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    let phoneNumberTextField = TextFieldStyle(frame: CGRect(), mode: .inactive).then {
        $0.textField.placeholder = "휴대폰 번호(-없이 숫자만 입력)"
    }
    
    let confirmButton = ButtonStyle(frame: CGRect(), mode: .inactive, text: "인증 문자 받기")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [explainLabel, phoneNumberTextField, confirmButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(168)
            $0.leading.equalToSuperview().inset(74)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(62)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(64)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
}
