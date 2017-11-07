//
//  ClinicExpense+CoreDataProperties.swift
//  Dental Account Book
//
//  Created by Apple on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension ClinicExpense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClinicExpense> {
        return NSFetchRequest<ClinicExpense>(entityName: "ClinicExpense")
    }

    @NSManaged public var amount: Int64
    @NSManaged public var date: NSDate?
    @NSManaged public var expenseName: String?

}
