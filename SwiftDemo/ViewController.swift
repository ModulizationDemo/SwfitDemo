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
import SwiftHandyFrame

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.ct_fill()
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Swift -> Extension -> Swift
            let controller = CTMediator.sharedInstance().A_showSwift { (result) in
                print(result)
            }
            navigationController?.pushViewController(controller!, animated: true)
        }
        
        if indexPath.row == 1 {
            // Swift -> Extension -> Objective-C
            let controller = CTMediator.sharedInstance().A_showObjc { (result) in
                print(result)
            }
            navigationController?.pushViewController(controller!, animated: true)
        }
        
        if indexPath.row == 2 {
            // Swift -> Category -> Swift
            let controller = CTMediator.sharedInstance().a_Category_Swift_ViewController { (result) in
                print(result ?? "fail")
            }
            navigationController?.pushViewController(controller!, animated: true)
        }
        
        if indexPath.row == 3 {
            // Swift -> Category -> Objective-C
            let controller = CTMediator.sharedInstance().a_Category_Objc_ViewController { (result) in
                print(result ?? "fail")
            }
            navigationController?.pushViewController(controller!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row]
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }

    // MARK: Getters and Setters
    lazy var tableView : UITableView = {
        let _tableView = UITableView(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()

    lazy var dataSource = [
        "Swift -> Extension -> Swift",
        "Swift -> Extension -> Objective-C",
        "Swift -> Category -> Swift",
        "Swift -> Category -> Objective-C"
    ]
}

