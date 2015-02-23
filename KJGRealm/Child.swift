//
//  Child.swift
//  KJGRealm
//
//  Created by Kevin Griffin on 2/23/15.
//  Copyright (c) 2015 Scoir, Inc. All rights reserved.
//

import Foundation
import Realm

class Child: RLMObject {
    
    dynamic var name:String = ""
    dynamic var age:Int = 0
    
    convenience init(response:[String:AnyObject]) {
        self.init()
        
        self.name = response["name"] as String
        self.age = response["age"] as Int
    }
    
    override class func primaryKey() -> String! {
        return "name"
    }
}