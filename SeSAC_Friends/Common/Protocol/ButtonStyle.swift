//
//  ButtonStyle.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit

// 추후 필요한 부분 추가 예정
enum ButtonMode: Int {
    case inactive
    case active
}

class ButtonStyle: UIButton {

    var mode: ButtonMode
    var text: String

    init(frame: CGRect, mode: ButtonMode, text: String) {
        self.mode = mode
        self.text = text
        super.init(frame: frame)
        setupView(text: text)
        setupMode(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView(text: String) {
        makeRounded(radius: 8)
        setTitle(text, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    func setupMode(mode: ButtonMode) {
        self.mode = mode
        switch self.mode {
        case .inactive:
            backgroundColor = Color.sesacGray6
            setTitleColor(Color.sesacGray3, for: .normal)
            isEnabled = true
        case .active:
            backgroundColor = Color.sesacGreen
            setTitleColor(Color.sesacWhite, for: .normal)
            isEnabled = true
        }
    }
}
