//
//  UIViewController+Extension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit

extension UIViewController {
    /// Show error Alert
    func showError(_ error: Error) {
        showErrorMessage(error.localizedDescription)
    }
    
    /// Show error Alert with message
    func showErrorMessage(_ message: String) {
        let alertViewController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertViewController, animated: true)
    }
}
