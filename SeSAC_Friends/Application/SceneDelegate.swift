//
//  SceneDelegate.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

import EasyKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = UINavigationController(rootViewController: HobbyViewController.instanceFromNib())
        window?.makeKeyAndVisible()
    }
}

