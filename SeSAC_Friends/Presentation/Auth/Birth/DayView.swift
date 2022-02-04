//
//  DayView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

class DayView: UIView, Representable {
    
    let dayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = Color.sesacGray7
    }
    
    let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = Color.sesacGray7
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = Color.sesacGray3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [dayLabel, dateLabel, lineView].forEach {
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalTo(dateLabel.snp.leading).inset(-40)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(11)
        }
        
        lineView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(dateLabel.snp.leading).inset(-4)
            $0.height.equalTo(1)
        }
    }
}
