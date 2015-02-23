//
//  NotebookMedia.swift
//  Scoir
//
//  Created by Kevin Griffin on 12/1/14.
//  Copyright (c) 2014 Scoir, Inc. All rights reserved.
//

import UIKit
import Realm

class NotebookMedia:RLMObject {
    
    dynamic var scid = 0
    dynamic var hashtags = ""
    dynamic var shared = 0
    dynamic var repinned = 0
    dynamic var studentId = ""
    dynamic var id = ""
    dynamic var caption = ""
    dynamic var flagged = 0
    dynamic var repins = 0
    dynamic var uploadDate = NSDate()
    dynamic var order = 0
    dynamic var text = ""
    dynamic var key = ""
    dynamic var notebookId = ""
    dynamic var width = 0
    dynamic var height = 0
    
    // MARK:
    //From json response
    convenience init(response:[String:AnyObject], notebookId:String) {
        self.init()
        scid = response["Scid"] as Int
        var hs = response["Hashtags"] as? [String] ?? [""]
        hashtags = " ".join(hs)
        shared = response["Shared"] as Int
        repinned = response["Repinned"] as? Int ?? 0
        studentId = response["StudentId"] as String
        id = response["Id"] as String
        caption = response["Caption"] as? String ?? ""
        text = response["Text"] as? String ?? ""
        flagged = response["Flagged"] as? Int ?? 0
        repins = response["Repins"] as Int
        
        if let ud = response["UploadDate"] as? String {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
            if let date = dateFormatter.dateFromString(ud) {
                self.uploadDate = date
            } else {
                dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
                if let date =  dateFormatter.dateFromString(ud) {
                    self.uploadDate = date
                }
            }
        }
        
        order = response["Order"] as Int
        key = response["Key"] as? String ?? ""
        
        if let dimensions = response["Dimension"] as? [String:AnyObject] {
            width = dimensions["X"] as Int
            height = dimensions["Y"] as Int
        }
        
        self.notebookId = notebookId
    }
    
    // MARK: Realm
    override class func primaryKey() -> String! {
        return "id"
    }
}