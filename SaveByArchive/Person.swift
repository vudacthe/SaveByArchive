//
//  Person.swift
//  SaveByArchive
//
//  Created by Apple on 2/6/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class Person: NSObject, NSCoding {
    var familyName: String
    var fullName: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("persons")
    
    struct PropertyKey {
        static let familyName = "familyName"
        static let fullname = "fullName"    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(familyName, forKey: PropertyKey.familyName)
        aCoder.encode(fullName, forKey: PropertyKey.fullname)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let familyName = aDecoder.decodeObject(forKey: PropertyKey.familyName) as? String
        
        let fullname = aDecoder.decodeObject(forKey: PropertyKey.fullname) as? String
        

    }

}

