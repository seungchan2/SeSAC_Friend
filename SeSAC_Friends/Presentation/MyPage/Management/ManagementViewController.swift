//
//  ManagementViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

final class ManagementViewController: BaseViewController {

    let managementView = ManagementView()
    
    override func loadView() {
        self.view = managementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    
    private func assignDelegation() {
        managementView.tableView.delegate = self
        managementView.tableView.dataSource = self
    }
}

extension ManagementViewController: UITableViewDelegate {
    
}

extension ManagementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = managementView.tableView.dequeueReusableCell(for: indexPath, cellType: ProfileImageTableViewCell.self)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = managementView.tableView.dequeueReusableCell(for: indexPath, cellType: UserTableViewCell.self)
            cell.selectionStyle = .none
            cell.contentView.makeRoundedWithBorder(radius: 10, color: Color.sesacGray2.cgColor)
            return cell
        case 2:
            let cell = managementView.tableView.dequeueReusableCell(for: indexPath, cellType: UserInfoTableViewCell.self)
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = managementView.tableView.dequeueReusableCell(for: indexPath, cellType: WithdrawalTableViewCell.self)
            cell.selectionStyle = .none
            return cell
        default:
            break
        }
      
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            guard let cell = managementView.tableView.cellForRow(at: indexPath) as? UserTableViewCell else { return }
            cell.sesacTitleView.isHidden = false
            cell.sesacReviewView.isHidden = false
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UIScreen.main.bounds.height * 0.24
        case 1:
            return 58
        case 2:
            return 320
        case 3:
            return 58
        default:
            break
        }
        return 100
    }
}
