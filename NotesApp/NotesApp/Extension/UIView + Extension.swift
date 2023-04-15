//
//  UIView + Extension.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit
import Foundation

extension UIView {
    
    func setCardShadow() {
        layer.shadowColor = UIColor(red: 20, green: 1, blue: 1, alpha: 0.1).cgColor
        layer.shadowOpacity = 10
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        
        ])
    }
}
