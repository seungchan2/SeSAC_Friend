//
//  SeSacBackgroundViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

final class SeSacBackgroundViewController: BaseViewController {

    private let listForBackground = [
        (image: Image.sesacParkBackground, name: "하늘 공원", price: "보유", backgroundColor: Color.sesacGray2, buttonTextColor: Color.sesacGray7, explain: "새싹들을 많이 마주치는 매력적인 하늘 공원입니다"),
        (image: Image.sesacNightBackground, name: "라틴 거실", price: "1,200", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "라틴 가구들과 식물이 조화로운 따듯한 거실입니다")
     ]
    
    let sesacBackgroundView = SeSacBackgroundView()
    
    override func loadView() {
        self.view = sesacBackgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
    }
    
    private func assignDelegation() {
        sesacBackgroundView.collectionView.delegate = self
        sesacBackgroundView.collectionView.dataSource = self
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }

}

extension SeSacBackgroundViewController: PageComponentProtocol {
    var pageTitle: String { "배경" }
}

extension SeSacBackgroundViewController: UICollectionViewDelegate {
    
}

extension SeSacBackgroundViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listForBackground.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sesacBackgroundView
            .collectionView.dequeueReusableCell(for: indexPath, cellType: BackgroundCollectionViewCell.self)
        
        // Image
        cell.backgroundImageView.image = listForBackground[indexPath.row].image
        
        // Label
        cell.nameLabel.text = listForBackground[indexPath.row].name
        cell.explainLabel.text = listForBackground[indexPath.row].explain
        
        //  Button
        cell.priceButton.setTitle(listForBackground[indexPath.row].price, for: .normal)
        cell.priceButton.backgroundColor = listForBackground[indexPath.row].backgroundColor
        cell.priceButton.setTitleColor(listForBackground[indexPath.row].buttonTextColor, for: .normal)

        
        return cell
    }
}

extension SeSacBackgroundViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
