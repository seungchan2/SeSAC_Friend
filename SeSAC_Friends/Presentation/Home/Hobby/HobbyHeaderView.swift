//
//  HobbyHeaderView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/11.
//

import UIKit

import SnapKit
import Then

class HobbyHeaderView: UICollectionReusableView {
      
    let headerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = Color.sesacBlack
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
           self.addSubview(headerLabel)
       }
       
       func setupConstraints() {
           headerLabel.snp.makeConstraints {
               $0.top.leading.equalToSuperview()
           }
       }
}
