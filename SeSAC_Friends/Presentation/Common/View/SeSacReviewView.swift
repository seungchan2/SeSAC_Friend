//
//  SeSacReviewView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

final class SeSacReviewView: UIView {
    
    let sesacLabel = UILabel().then {
        $0.text = "새싹 리뷰"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    let reviewLabel = UILabel().then {
        $0.text = "첫 리뷰를 기다리는 중이에요"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0 
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
        [sesacLabel, reviewLabel].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        sesacLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(sesacLabel.snp.bottom).inset(-16)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
