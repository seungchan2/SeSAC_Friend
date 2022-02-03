//
//  ShopView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

import SnapKit
import Then

final class ShopView: UIView {
    
    let navigationTitleLabel = UILabel().then {
        $0.text = "새싹샵"
    }
    
    let sesacBackgroundImage = UIImageView().then {
        $0.image = Image.sesacBackground
        $0.makeRounded(radius: 10)
    }
    
    let sesacMainImage = UIImageView().then {
        $0.image = Image.sesacFace
    }
    
    let saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(Color.sesacWhite, for: .normal)
        $0.backgroundColor = Color.sesacGreen
        $0.makeRounded(radius: 8)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
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
      [navigationTitleLabel, bottomView, sesacBackgroundImage, sesacMainImage, saveButton, pagerTab]
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
        
        sesacBackgroundImage.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom).inset(-15)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalToSuperview().multipliedBy(0.24)
        }
        
        sesacMainImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(sesacBackgroundImage)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(sesacBackgroundImage.snp.top).inset(13)
            $0.trailing.equalTo(sesacBackgroundImage.snp.trailing).inset(15)
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
        
        pagerTab.snp.makeConstraints {
            $0.top.equalTo(sesacBackgroundImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
