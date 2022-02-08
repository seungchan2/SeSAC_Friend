//
//  TabBarController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/26.
//

import UIKit

import EasyKit

final class TabBarController: UITabBarController {
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarAppearance()
        setTabBarItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height = UIScreen.main.bounds.height / 9
        tabBar.frame.size.height = height
        tabBar.frame.origin.y = view.frame.height - height
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let imageView = tabBar.subviews[item.tag + 1].subviews.compactMap({ $0 as? UIImageView }).first else { return }
        tabBarItemBounceAnimation(imageView: imageView)
    }
}

// MARK: - Functions

extension TabBarController {
    private func setTabBarAppearance() {
        UITabBar.clearShadow()
        UITabBar.appearance().tintColor = Color.sesacBlack
        UITabBar.appearance().unselectedItemTintColor = Color.sesacGray6

//        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 11.0)!]
//        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = Color.sesacWhite.cgColor
    }

    private func setTabBarItems() {
        tabs = [
            UINavigationController(rootViewController: HomeViewController.instanceFromNib()),
            UINavigationController(rootViewController: ShopViewController.instanceFromNib()),
            UINavigationController(rootViewController: SeSacFriendViewController.instanceFromNib()),
            UINavigationController(rootViewController: InformationViewController.instanceFromNib())
        ]

        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
    
    private func tabBarItemBounceAnimation(imageView: UIImageView) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {
            
            imageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut) {
                
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
