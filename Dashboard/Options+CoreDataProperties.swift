//
//  Options+CoreDataProperties.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/12/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Foundation
import CoreData


extension Options {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Options> {
        return NSFetchRequest<Options>(entityName: "Options");
    }

    @NSManaged public var option_1: String?
    @NSManaged public var option_2: String?
    @NSManaged public var option_3: String?
    @NSManaged public var option_4: String?
    @NSManaged public var option_5: String?
    @NSManaged public var count_1: Int16
    @NSManaged public var count_2: Int16
    @NSManaged public var count_3: Int16
    @NSManaged public var count_4: Int16
    @NSManaged public var count_5: Int16
    @NSManaged public var question: TrackingItem?

}
