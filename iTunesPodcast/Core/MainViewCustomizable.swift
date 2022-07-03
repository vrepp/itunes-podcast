//
//  MainViewCustomizable.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit

public protocol MainViewCustomizable {
    associatedtype MainView: UIView
}

extension MainViewCustomizable where Self: UIViewController {
    /// return view as MainView type
    public var mainView: MainView {
        guard let mainView = view as? MainView else {
            fatalError("Expected view to be of type \(MainView.self) but got \(type(of: view)) instead")
        }
        
        return mainView
    }
}
