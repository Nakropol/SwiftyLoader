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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myString = SwiftyLoader.doSomething()
        print(myString)
        
    }


}

