//
//  ViewController.swift
//  SwiftDemo
//
//  Created by casa on 2016/12/31.
//  Copyright © 2016年 casa. All rights reserved.
//

import UIKit
import A_Category

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let acontroller = CTMediator.sharedInstance().a_aViewController()
        self.navigationController?.pushViewController(acontroller!, animated: true)
    }
}

