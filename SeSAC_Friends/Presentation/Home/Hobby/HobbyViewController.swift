//
//  HobbyViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/10.
//

import UIKit

final class HobbyViewController: BaseViewController {

    let hobbyView = HobbyView()
    let data: [String] = ["ㅎㅇ", "ㅁㄴㅇㅁㅇ"]
    override func loadView() {
        view = hobbyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
    }

    override func style() {
        super.style()
        view.backgroundColor = .white
    }
    
    private func assignDelegation() {
        hobbyView.collectionView.delegate = self
        hobbyView.collectionView.dataSource = self
    }


}

extension HobbyViewController: UICollectionViewDelegate {
    
}

extension HobbyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hobbyView.collectionView.dequeueReusableCell(for: indexPath, cellType: HobbyCollectionViewCell.self)
        
        cell.hobbyLabel.text = data[indexPath.item]
        return cell
    }
    
    
}

extension HobbyViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let cell = hobbyView.collectionView.dequeueReusableCell(for: indexPath, cellType: HobbyCollectionViewCell.self)
///
//        return CGSize(width: size.width + 32, height: 32.0)
//        }
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: data[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 32)
}
        
}
