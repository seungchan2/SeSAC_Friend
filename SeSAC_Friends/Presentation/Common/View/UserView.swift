//
//  UserView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

final class UserView: UIView {
    
    let userNameLabel = UILabel().then {
        $0.text = "김새싹"
    }
    
    let toggleButton = UIButton().then {
        $0.setImage(Image.sesacDownArrow, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI() {
        [userNameLabel, toggleButton].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        toggleButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
