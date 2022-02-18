//
//  FindSeSACView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

import SnapKit
import Then

final class FindSeSACView: UIView {
    
    let navigationTitleLabel = UILabel().then {
        $0.text = "새싹 찾기"
    }
    
    let stopFindButton = UIButton().then {
        $0.setTitle("찾기중단", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let backButton = UIButton().then {
        $0.setImage(Image.sesacBack, for: .normal)
    }
    
    let bottomView = UIView().then {
        $0.backgroundColor = Color.sesacGray2
    }
    
    let pagerTab = PagerTab()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setView() {
      [navigationTitleLabel, bottomView, stopFindButton, backButton, pagerTab]
            .forEach {
                addSubview($0)
            }
    }
    
    private func setConstraints() {
        navigationTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(54)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(navigationTitleLabel.snp.bottom).inset(-11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        stopFindButton.snp.makeConstraints {
            $0.centerY.equalTo(navigationTitleLabel)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(22)
            $0.width.equalTo(52)
        }
        
        pagerTab.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
}

