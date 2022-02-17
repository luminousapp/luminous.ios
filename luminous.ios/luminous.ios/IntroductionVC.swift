//
//  IntroductionVC.swift
//  luminous.ios
//
//  Created by Stephen Learmonth on 17/02/2022.
//

import UIKit

final class IntroductionVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Luminous"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        view.layoutSubviews()
        
    }
}
