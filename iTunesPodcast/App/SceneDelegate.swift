//
//  SceneDelegate.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}
