//
//  ViewController.swift
//  SwiftyLoaderExample
//
//  Created by Orkan Çep on 8.04.2020.
//  Copyright © 2020 Orkan Çep. All rights reserved.
//

import UIKit
import SwiftyLoader

class ViewController: UIViewController {
    
    let loader = SwiftyLoader()
    
    let mainButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureMainButton()
        
    }
    
    func configureMainButton() {
        view.addSubview(mainButton)
        mainButton.setTitle("Test Loader", for: .normal)
        mainButton.addTarget(self, action: #selector(goView), for: .touchUpInside)
        mainButton.setTitleColor(.systemBlue, for: .normal)
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        let cons = [
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(cons)
    }

    
    @objc func goView() {
        loader.startLoader() {
            self.loader.closeLoader()
        }
    }

}

