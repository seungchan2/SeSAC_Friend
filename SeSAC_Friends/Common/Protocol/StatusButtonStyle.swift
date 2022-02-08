//
//  MapButtonStyle.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

import SnapKit
import Then

enum StatusButtonMode {
    case search
    case loading
    case message
}

class StatusButtonStyle: UIButton {
    
    var button = UIButton()
    var mode: StatusButtonMode
    
    init(frame: CGRect, mode: StatusButtonMode) {
        self.mode = mode
        super.init(frame: frame)
        setUI()
        setConstraints()
        setupMode(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        self.addSubview(button)
    }
    
    func setConstraints() {
        button.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            
        }
    }
    
    func setupMode(mode: StatusButtonMode) {
        switch mode {
        case .search:
            button.setImage(Image.sesacSearch, for: .normal)
        case .loading:
            button.setImage(Image.sesacLoading, for: .normal)
        case .message:
            button.setImage(Image.sesacMessage, for: .normal)
        }
    }
}
