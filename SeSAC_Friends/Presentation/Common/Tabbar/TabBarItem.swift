//
//  TabBarItem.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/26.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case home
    case shop
    case friend
    case info
}

extension TabBarItem {
    var title: String {
        switch self {
        case .home:         return "홈"
        case .shop:        return "새싹샵"
        case .friend:       return "새싹친구"
        case .info:     return "내정보"
        }
    }
}

extension TabBarItem {
    var inactiveIcon: UIImage? {
        switch self {
        case .home:         return Image.sesacHome
        case .shop:        return Image.sesacGift
        case .friend:       return Image.sesacLeaf
        case .info:     return Image.sesacPerson
        }
    }
    
    var activeIcon: UIImage? {
        switch self {
        case .home:         return Image.sesacHome
        case .shop:        return Image.sesacGift
        case .friend:       return Image.sesacLeaf
        case .info:     return Image.sesacPerson
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: inactiveIcon,
            selectedImage: activeIcon
        )
    }
}

