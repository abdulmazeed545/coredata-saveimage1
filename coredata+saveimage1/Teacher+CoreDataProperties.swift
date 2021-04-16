//
//  Teacher+CoreDataProperties.swift
//  coredata+saveimage1
//
//  Created by Shaik abdul mazeed on 16/04/21.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var myimage: Data?

}

extension Teacher : Identifiable {

}
