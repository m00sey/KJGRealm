//
//  Cover.swift
//  Scoir
//
//  Created by Kevin Griffin on 12/16/14.
//  Copyright (c) 2014 Scoir, Inc. All rights reserved.
//

import UIKit
import Realm

class Cover: RLMObject {
    dynamic var schoolName = ""
    dynamic var studentName = ""
    dynamic var key = ""
    dynamic var caption = ""
    dynamic var text = ""
    dynamic var flagged = false
    dynamic var uploadDate = ""
    dynamic var scid = 0
    dynamic var id = ""
    dynamic var photoHeight = 0
    dynamic var photoWidth = 0
    dynamic var studentId = ""
    dynamic var mimeType = ""
    dynamic var order = 0
    dynamic var repinned = false
    dynamic var repins = 0
    dynamic var shared = false
    dynamic var hashtags = ""
    
    convenience init(response:[String:AnyObject]) {
        self.init()
        
        schoolName = response["SchoolName"] as? String ?? ""
        
        var dimens = response["Dimension"] as [String:Int]
        photoHeight = dimens["Y"]!
        photoWidth = dimens["X"]!
        
        key = response["Key"] as? String ?? ""
        caption =  response["Caption"] as? String ?? ""
        text = response["Text"] as? String ?? ""
        mimeType = response["Mime"] as String
        
        //only basic types in Realm
        var hs = response["Hashtags"] as? [String] ?? [""]
        hashtags = " ".join(hs)
        
        flagged = response["Flagged"] as Bool
        order = response["Order"] as Int
        repinned = response["Repinned"] as Bool
        repins = response["Repins"] as Int
        shared = response["Shared"] as Bool
        
        uploadDate = response["UploadDate"] as String
        scid = response["Scid"] as Int
        id = response["Id"] as String
        studentId = response["StudentId"] as String
    }
    
    override class func primaryKey() -> String! {
        return "id"
    }
}