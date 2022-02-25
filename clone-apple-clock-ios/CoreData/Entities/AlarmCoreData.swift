//
//  AlarmCoreData.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation
import CoreData

//@objc(AlarmCoreData)
public class AlarmCoreData: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlarmCoreData> {
        return NSFetchRequest<AlarmCoreData>(entityName: "AlarmCoreData")
    }

    @NSManaged public var label: String?
    @NSManaged public var snooze: Bool
    @NSManaged public var sound: String?
    @NSManaged public var `repeat`: String?
    @NSManaged public var time: Date?
    
}
