//
//  informationView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

import SnapKit
import Then
import EasyKit

final class informationView: UIView {
    
    let informationLabel = UILabel().then {
        $0.text = "내 정보"
        $0.textColor = Color.sesacBlack
    }
    
    let informationTableView = UITableView().then {
        $0.register(informationTableViewCell.self)
        $0.isScrollEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        [informationLabel, informationTableView].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        informationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(58)
        }
        
        informationTableView.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
