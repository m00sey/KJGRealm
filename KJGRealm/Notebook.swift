//
//  Notebook.swift
//  Scoir
//
//  Created by Kevin Griffin on 11/30/14.
//  Copyright (c) 2014 Scoir, Inc. All rights reserved.
//

import Foundation
import Realm

class Notebook: RLMObject {
    
    dynamic var id = ""
    dynamic var name = ""
    dynamic var city = ""
    dynamic var favorite = 0
    dynamic var following = 0
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    dynamic var profile = ""
    dynamic var scid = 0
    dynamic var shared = 0
    dynamic var state = ""
    dynamic var zip = ""
    dynamic var studentId = ""
    dynamic var studentName = ""
    dynamic var sharedDate = ""
    
    dynamic var cover:Cover?
    dynamic var media = RLMArray(objectClassName: NotebookMedia.className())
    
    convenience init(response:[String:AnyObject]) {
        self.init()
        
        id = response["Id"] as String
        scid = response["Scid"] as Int
        name = response["Name"] as String
        studentId = response["StudentId"] as String
        profile = response["RCProfile"] as String
        city = response["City"] as String
        state = response["State"] as String
        zip = response["Zip"] as String
        studentName = response["StudentName"] as String
        sharedDate = response["SharedDate"] as String
        favorite = response["Favorite"] as Int
        following = response["Following"] as Int
        shared = response["Shared"] as Int
        
        if let location = response["Location"] as? [String:AnyObject] {
            var coordinates = location["coordinates"] as [Double]
            longitude = coordinates.first!
            latitude = coordinates.last!
        }
        
        if let coverResponse = response["Cover"] as? [String:AnyObject] {
            cover = Cover(response: coverResponse)
        }
        
        if let mediaItems = response["Media"] as? [[String:AnyObject]] {
            for mi in mediaItems {
                self.media.addObject(NotebookMedia(response: mi, notebookId: self.id))
            }
        }
    }
    
    override class func primaryKey() -> String! {
        return "id"
    }
    
    
    //MARK: SHIT
    class func myNotebooks() -> RLMResults {
        return Notebook.allObjectsInRealm(RLMRealm.defaultRealm()).sortedResultsUsingDescriptors([RLMSortDescriptor(property: "name", ascending: true)])
    }
    
    class func deleteMyNotebooks() {
        Notebook.deleteResults(RLMRealm.defaultRealm(), results: Notebook.myNotebooks())
    }
    
    class func deleteResults(realm:RLMRealm, results:RLMResults) {
        realm.beginWriteTransaction()
        for result in results {
            realm.deleteObject(result)
        }
        realm.commitWriteTransaction()
        return
    }
    
    class func save(notebook:Notebook) {
        Notebook.save(notebook, inRealm: RLMRealm.defaultRealm())
    }
    
    class func save(notebook:Notebook, inRealm realm:RLMRealm)  {
        realm.beginWriteTransaction()
        realm.addOrUpdateObject(notebook)
        realm.commitWriteTransaction()
    }
    
    class func save(notebooks:[Notebook]) {
        Notebook.save(notebooks, inRealm: RLMRealm.defaultRealm())
    }
    
    class func save(notebooks:[Notebook], inRealm realm:RLMRealm)  {
        realm.beginWriteTransaction()
        realm.addOrUpdateObjectsFromArray(notebooks)
        realm.commitWriteTransaction()
    }
}