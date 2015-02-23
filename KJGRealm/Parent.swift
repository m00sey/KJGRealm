//
//  Parent.swift
//  KJGRealm
//
//  Created by Kevin Griffin on 2/23/15.
//  Copyright (c) 2015 Scoir, Inc. All rights reserved.
//

import Foundation
import Realm

class Parent: RLMObject {
    
    dynamic var name:String = ""
    dynamic var child:Child?
    
    convenience init(response:[String:AnyObject]) {
        self.init()
        
        self.name = response["name"] as String
        if let child = response["child"] as? [String:AnyObject] {
            self.child = Child(response: child)
        }
    }
    
    override class func primaryKey() -> String! {
        return "name"
    }
}