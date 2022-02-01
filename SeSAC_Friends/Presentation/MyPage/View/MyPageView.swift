//
//  MyPageView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

import SnapKit
import Then
import EasyKit

final class MyPageView: UIView {
    
    let informationLabel = UILabel().then {
        $0.text = "내 정보"
        $0.textColor = Color.sesacBlack
    }
    
    let myPageTableView = UITableView().then {
        $0.register(MyPageTableViewCell.self)
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
        [informationLabel, myPageTableView].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        informationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).inset(13)
        }
        
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
