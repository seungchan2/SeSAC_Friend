//
//  SeSacBackgroundView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

import SnapKit
import Then

final class SeSacBackgroundView: UIView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(BackgroundCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 30 , height: UIScreen.main.bounds.width / 2 - 15)
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.collectionViewLayout = layout
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
      addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
