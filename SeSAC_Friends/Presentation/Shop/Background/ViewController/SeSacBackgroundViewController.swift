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
        (image: Image.sesacNightBackground, name: "씨티 뷰", price: "1,200", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "창밖으로 보이는 도시 야경이 아름다운 공간입니다"),
        (image: Image.sesacNightWalkBackground, name: "밤의 산책로", price: "1,200", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "어둡지만 무섭지 않은 조용한 산책로입니다"),
        (image: Image.sesacWalkBackground, name: "낮의 산책로", price: "1,200", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "즐겁고 가볍게 걸을 수 있는 산책로입니다"),
        (image: Image.sesacStageBackground, name: "연극 무대", price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "연극의 주인공이 되어 연기를 펼칠 수 있는 무대입니다"),
        (image: Image.sesacLatinBackground, name: "라틴 거실", price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "모노톤의 따스한 감성의 거실로 편하게 쉴 수 있는 공간입니다"),
        (image: Image.sesacHomeBackground, name: "홈트방", price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "집에서 운동을 할 수 있도록 기구를 갖춘 방입니다"),
        (image: Image.sesacMusicBackground, name: "뮤지션 작업실", price: "2,500", backgroundColor: Color.sesacGreen, buttonTextColor: Color.sesacWhite, explain: "여러가지 음악 작업을 할 수 있는 작업실입니다")
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
