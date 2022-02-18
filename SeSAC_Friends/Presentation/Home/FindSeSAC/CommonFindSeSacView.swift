//
//  CommonFindSeSacView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/16.
//

import UIKit

import SnapKit
import Then

final class CommonFindSeSacView: UIView {
    
    let sesacLeaf = UIImageView().then {
        $0.image = Image.sesacFindLeaf
    }
    
    let sesacLabel = UILabel().then {
        $0.text = "아쉽게도 주변에 새싹이 없어요 ㅠ"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = Color.sesacBlack
    }
    
    let hobbyLabel = UILabel().then {
        $0.text = "취미를 변경하거나 조금만 더 기다려주세요!"
        $0.textAlignment = .center
        $0.textColor = Color.sesacGray7
        $0.font = .systemFont(ofSize: 14)
    }
    
    let changeButton = AuthButtonStyle(frame: CGRect(), mode: .active, text: "취미 변경하기")
    
    let refreshButton = UIButton().then {
        $0.setImage(Image.sesacRefresh, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGreen.cgColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setView() {
        [sesacLeaf, sesacLabel, hobbyLabel, changeButton, refreshButton]
            .forEach {
                addSubview($0)
            }
    }
    
    private func setConstraints() {
        sesacLeaf.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.6)
            $0.width.height.equalTo(64)
        }
        
        sesacLabel.snp.makeConstraints {
            $0.top.equalTo(sesacLeaf.snp.bottom).inset(-40)
            $0.centerX.equalToSuperview()
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(sesacLabel.snp.bottom).inset(-8)
            $0.centerX.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(25)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(refreshButton.snp.leading).inset(-8)
            $0.height.equalTo(48)
        }
        
        refreshButton.snp.makeConstraints {
            $0.centerY.equalTo(changeButton)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(48)
        }
    }
}


