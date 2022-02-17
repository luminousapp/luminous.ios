//
//  PageContentVC.swift
//  luminous.ios
//
//  Created by Stephen Learmonth on 17/02/2022.
//

import UIKit

final class PageContentVC: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        view.layoutSubviews()
    }
    
    func configure(index: Int, title: String) {
        self.index = index
        self.titleLabel.text = title
    }
}
