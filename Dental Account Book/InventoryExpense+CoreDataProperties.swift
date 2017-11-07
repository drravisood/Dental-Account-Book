//
//  InventoryExpense+CoreDataProperties.swift
//  Dental Account Book
//
//  Created by Apple on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension InventoryExpense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryExpense> {
        return NSFetchRequest<InventoryExpense>(entityName: "InventoryExpense")
    }

    @NSManaged public var costPerUnit: Int64
    @NSManaged public var date: NSDate?
    @NSManaged public var materialName: String?
    @NSManaged public var numberOfUnits: Int64
    @NSManaged public var totalCost: Int64

}
