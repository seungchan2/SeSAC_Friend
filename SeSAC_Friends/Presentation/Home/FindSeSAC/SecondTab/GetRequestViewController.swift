//
//  GetRequestViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

final class GetRequestViewController: BaseViewController {

    let commonView = GetRequestView()
    
    override func loadView() {
        self.view = commonView
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
        commonView.tableView.delegate = self
        commonView.tableView.dataSource = self
    }
}

extension GetRequestViewController: PageComponentProtocol {
    var pageTitle: String { "받은 요청" }
}

extension GetRequestViewController: UITableViewDelegate {
    
}

extension GetRequestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commonView.tableView.dequeueReusableCell(for: indexPath, cellType: GetRequestTableViewCell.self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
