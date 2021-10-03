//
//  Memo+CoreDataProperties.swift
//  CoreDataIsEasy
//
//  Created by 박준영 on 9/30/21.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var category: String?
    @NSManaged public var contents: String?

}

extension Memo : Identifiable {

}
