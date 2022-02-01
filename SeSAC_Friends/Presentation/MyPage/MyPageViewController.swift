//
//  MyPageViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    private let listForMyPage = [
        (image: Image.sesacNotice, text: "공지사항"),
        (image: Image.sesacQnA, text: "자주 묻는 질문"),
        (image: Image.sesacFaq, text: "1:1 문의"),
        (image: Image.sesacRing, text: "알림 설정"),
        (image: Image.sesacPermit, text: "이용 약관")
    ]
    
    let myPageView = MyPageView()
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
        myPageView.myPageTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "MyPageHeaderView")
        
    }
    
    private func assignDelegation() {
        myPageView.myPageTableView.delegate = self
        myPageView.myPageTableView.dataSource = self
    }
    
    
    override func style() {
        view.backgroundColor = .white
    }
    
}

extension MyPageViewController: UITableViewDelegate {
    
}

extension MyPageViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listForMyPage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myPageView.myPageTableView.dequeueReusableCell(for: indexPath, cellType: MyPageTableViewCell.self)
        cell.selectionStyle = .none
        cell.separatorInset.right = 15
        cell.profileImage.image = listForMyPage[indexPath.row].image
        cell.infoLabel.text = listForMyPage[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = myPageView.myPageTableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageHeaderView")
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        let view = MyPageHeaderView().then {
            $0.backgroundColor = .white
        }
        
        header.backgroundView = view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}
