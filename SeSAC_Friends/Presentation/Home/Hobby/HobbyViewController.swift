//
//  HobbyViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/10.
//

import UIKit

import SnapKit
import Then

final class HobbyViewController: BaseViewController {
    // ViewModel에 Extension 다시 수정해서 넣기
    
    
    let hobbyView = HobbyView()
    let dataList: [String] = ["아무거나", "SeSAC", "코딩", "맛집탐방", "공원산책", "독서모임", "다욱이", "쓰레기줍기"]
    var exList: [String] = [] {
        didSet {
            hobbyView.collectionView.reloadData()
        }
    }
    
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
        hobbyView.searchBar.delegate = self
    }
}

extension HobbyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = hobbyView.searchBar.text else { return }
        let searchText = text.components(separatedBy: " ")
        exList.append(contentsOf: searchText)
        hobbyView.searchBar.text = ""
    }
}

extension HobbyViewController: UICollectionViewDelegate {
    
}

extension HobbyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            // 추후 서버통신
            return dataList.count
        case 1:
            return exList.count
        default:
            break
        }
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = hobbyView.collectionView.dequeueReusableCell(for: indexPath, cellType: NearHobbyCollectionViewCell.self)
            
            cell.makeRoundedWithBorder(radius: 8, color: Color.sesacGreen.cgColor)
            cell.hobbyLabel.text = dataList[indexPath.item]
            return cell
            
        case 1:
            let cell = hobbyView.collectionView.dequeueReusableCell(for: indexPath, cellType: MyHobbyCollectionViewCell.self)
            
            cell.makeRoundedWithBorder(radius: 8, color: Color.sesacGreen.cgColor)
            cell.hobbyLabel.text = exList[indexPath.item]
            return cell
        default :
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            exList.remove(at: indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = hobbyView.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HobbyHeaderView.reuseIdentifier, for: indexPath) as? HobbyHeaderView else { return UICollectionReusableView()}
        switch indexPath.section {
            
        case 0:
            headerView.headerLabel.text = "지금 주변에는"
            
        case 1:
            headerView.headerLabel.text = "내가 하고 싶은"
            
        default:
            break
            
        }
        return headerView
    }
    
}

extension HobbyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: dataList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 50, height: 32)
        case 1:
            return CGSize(width: exList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 50, height: 32)
        default:
            break
        }
        
        return CGSize(width: 1, height: 1)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 20)
    }
}
