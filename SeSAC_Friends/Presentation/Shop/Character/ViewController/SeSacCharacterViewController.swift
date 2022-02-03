//
//  SeSacCharacterViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

final class SeSacCharacterViewController: BaseViewController {
    
    private let listForCharacter = [
        (image: Image.sesacNormalFace, name: "기본 새싹", price: "보유", backgroundColor: Color.sesacGray2, buttonTextColor: Color.sesacGray7, explain: "새싹을 대표하는 기본 식물입니다. 다른 새싹들과 함께 하는 것을 좋아합니다."),
        (image: Image.sesacStrongFace, name: "튼튼 새싹", price: "1,200", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "잎이 하나 더 자라나고 튼튼해진 새나라의 새싹으로 같이 있으면 즐거워집니다."),
        (image: Image.sesacMintFace,  name: "민트 새싹",price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "호불호의 대명사! 상쾌한 향이 나서 허브가 대중화된 지역에서 많이 자랍니다."),
        (image: Image.sesacPurpleFace,  name: "퍼플 새싹",price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "감정을 편안하게 쉬도록 하며 슬프고 우울한 감정을 진정시켜주는 멋진 새싹입니다."),
        (image: Image.sesacGoldFace,  name: "골드 새싹",price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "화려하고 멋있는 삶을 살며 돈과 인생을 플렉스 하는 자유분방한 새싹입니다.")
    ]

    let sesacCharacterView = SeSacCharacterView()
    
    override func loadView() {
        self.view = sesacCharacterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
    }
    
    private func assignDelegation() {
        sesacCharacterView.collectionView.delegate = self
        sesacCharacterView.collectionView.dataSource = self
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
}

extension SeSacCharacterViewController: PageComponentProtocol {
    var pageTitle: String { "새싹" }
}

extension SeSacCharacterViewController: UICollectionViewDelegate {
    
}

extension SeSacCharacterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listForCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sesacCharacterView.collectionView.dequeueReusableCell(for: indexPath, cellType: CharacterCollectionViewCell.self)
        
        // Image
        cell.characterImageView.image = listForCharacter[indexPath.row].image
        
        // Label
        cell.nameLabel.text = listForCharacter[indexPath.row].name
        cell.explainLabel.text = listForCharacter[indexPath.row].explain
        
        //  Button
        cell.priceButton.setTitle(listForCharacter[indexPath.row].price, for: .normal)
        cell.priceButton.backgroundColor = listForCharacter[indexPath.row].backgroundColor
        cell.priceButton.setTitleColor(listForCharacter[indexPath.row].buttonTextColor, for: .normal)
        
        return cell
    }
}

extension SeSacCharacterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
