//
//  Patients+CoreDataProperties.swift
//  Dental Account Book
//
//  Created by Apple on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension Patients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patients> {
        return NSFetchRequest<Patients>(entityName: "Patients")
    }

    @NSManaged public var amountPaid: Int64
    @NSManaged public var balanceDue: Int64
    @NSManaged public var datePaid: NSDate?
    @NSManaged public var datePicker: NSDate?
    @NSManaged public var opdNumber: Int64
    @NSManaged public var patientName: String?
    @NSManaged public var totalInvoice: Int64

}
