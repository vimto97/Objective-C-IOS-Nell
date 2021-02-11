//
//  Logins+CoreDataProperties.swift
//  Simple Login
//

//
//

import Foundation
import CoreData


extension Logins {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Logins> {
        return NSFetchRequest<Logins>(entityName: "Logins")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
