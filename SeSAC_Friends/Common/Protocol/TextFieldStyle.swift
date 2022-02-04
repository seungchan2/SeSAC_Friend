//
//  TextFieldStyle.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

enum TextFieldMode: Int {
    case inactive
    case end
    case active
}

class TextFieldStyle: UIView, Representable {
    
    let textField = UITextField().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 14)
        $0.placeholder = ""
    }
    
    let lineView = UIView()
    var mode: TextFieldMode
    
    init(frame: CGRect, mode: TextFieldMode) {
        self.mode = mode
        super.init(frame: frame)
        setUI()
        setupConstraints()
        setupMode(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    internal func setUI() {
        [textField, lineView].forEach {
           addSubview($0)
        }
    }
    
    internal func setupConstraints() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func setupMode(mode: TextFieldMode) {
        self.mode = mode
        switch self.mode {
        case .inactive:
            textField.textColor = Color.sesacGray7
            lineView.backgroundColor = Color.sesacGray3
        case .end:
            textField.textColor = Color.sesacBlack
            lineView.backgroundColor = Color.sesacBlack
        case .active:
            textField.textColor = Color.sesacBlack
            lineView.backgroundColor = Color.sesacGray3
        }
    }
}
