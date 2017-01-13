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

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Options> {
        return NSFetchRequest<Options>(entityName: "Options");
    }

    public func optionsToArray() -> [String] {
        var arr = [String]()
        if option_1 != nil {
            arr.append(option_1!)
        }
        if option_2 != nil {
            arr.append(option_2!)
        }
        if option_3 != nil {
            arr.append(option_3!)
        }
        if option_4 != nil {
            arr.append(option_4!)
        }
        if option_5 != nil {
            arr.append(option_5!)
        }
        return arr
    }

    public func countsToArray() -> [Int] {
        var arr = [Int]()
        arr.append(Int(count_1))
        arr.append(Int(count_2))
        arr.append(Int(count_3))
        arr.append(Int(count_4))
        arr.append(Int(count_5))
        return arr
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
