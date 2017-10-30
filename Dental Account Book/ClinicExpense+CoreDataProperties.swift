//
//  ClinicExpense+CoreDataProperties.swift
//  Dental Account Book
//
//  Created by Apple on 10/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension ClinicExpense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClinicExpense> {
        return NSFetchRequest<ClinicExpense>(entityName: "ClinicExpense")
    }

    @NSManaged public var expenseName: String?
    @NSManaged public var amount: Int64
    @NSManaged public var date: Date

}
