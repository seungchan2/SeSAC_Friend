//
//  AuthCommonView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

// Phone, Nickname, Email 공통적으로 쓰임
class AuthCommonView: UIView, Representable {
    
    let explainLabel = UILabel().then {
        $0.text = "새싹 서비스 이용을 위해\n휴대폰 번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    let backButton = UIButton().then {
        $0.setImage(Image.sesacBack, for: .normal)
    }
    
    let subTextLabel = UILabel().then {
        $0.text = "휴대폰 번호 변경 시 인증을 위해서 사용해요"
        $0.textColor = Color.sesacGray7
        $0.textAlignment = .center
        $0.isHidden = true
    }
    
    let commonTextField = TextFieldStyle(frame: CGRect(), mode: .inactive).then {
        $0.textField.placeholder = "휴대폰 번호(-없이 숫자만 입력)"
    }
    
    let confirmButton = AuthButtonStyle(frame: CGRect(), mode: .inactive, text: "다음")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [explainLabel, backButton, commonTextField, confirmButton, subTextLabel].forEach {
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(168)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57)
            $0.leading.equalToSuperview().inset(13)
            $0.width.height.equalTo(24)
        }
        
        subTextLabel.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).inset(-8)
            $0.centerX.equalToSuperview()
        }
        
        commonTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(62)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(commonTextField.snp.bottom).offset(64)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
}
