//
//  TrackingItem+CoreDataProperties.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/12/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Foundation
import CoreData


extension TrackingItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackingItem> {
        return NSFetchRequest<TrackingItem>(entityName: "TrackingItem");
    }

    @NSManaged public var name: String?
    @NSManaged public var hasGoal: Bool
    @NSManaged public var isActive: Bool
    @NSManaged public var question: String?
    @NSManaged public var answerChoices: Options?

}
