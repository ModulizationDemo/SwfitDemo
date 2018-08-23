//
//  ViewController.swift
//  SwiftDemo
//
//  Created by casa on 2016/12/31.
//  Copyright © 2016年 casa. All rights reserved.
//

import UIKit
import A_Category
import A_Extension

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Category
//        let acontroller = CTMediator.sharedInstance().a_aViewController{ result in
//            print(result ?? "default value")
//        }

        // Extension
        let acontroller = CTMediator.sharedInstance().A_show { (result) in
            print(result)
        }
        navigationController?.pushViewController(acontroller!, animated: true)
    }
}

