//
//  UITableViewExtension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import UIKit

extension UITableView {
    
    func register(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        
        if Bundle.main.path(forResource: className, ofType: "nib") != nil {
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forCellReuseIdentifier: className)
        } else {
            register(cellType, forCellReuseIdentifier: className)
        }
    }
    
    func register(cellTypes: [UITableViewCell.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
    
    func register(cellType: UITableViewHeaderFooterView.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        
        if Bundle.main.path(forResource: className, ofType: "nib") != nil {
            let nib = UINib(nibName: className, bundle: bundle)
            register(nib, forHeaderFooterViewReuseIdentifier: className)
        } else {
            register(cellType, forHeaderFooterViewReuseIdentifier: className)
        }
    }
    
    func register(cellTypes: [UITableViewHeaderFooterView.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with cellType: T.Type) -> T {
        let className = String(describing: cellType)
        return self.dequeueReusableHeaderFooterView(withIdentifier: className) as! T
    }
}
