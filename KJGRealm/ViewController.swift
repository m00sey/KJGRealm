//
//  ViewController.swift
//  KJGRealm
//
//  Created by Kevin Griffin on 2/23/15.
//  Copyright (c) 2015 Scoir, Inc. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    let response:[String:AnyObject] = ["name":"Kevin", "child":["name":"basil", "age": 10]]
    let realm:RLMRealm = RLMRealm.defaultRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println(RLMRealm.defaultRealm().path)
        
        realm.beginWriteTransaction()
        realm.addOrUpdateObject(Parent(response: response))
        realm.commitWriteTransaction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

