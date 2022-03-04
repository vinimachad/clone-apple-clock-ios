//
//  AlarmCoreData.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation
import CoreData

class AlarmCoreData: NSManagedObject {
    @NSManaged var label: String?
    @NSManaged var snooze: Bool
    @NSManaged var sound: String?
    @NSManaged var `repeat`: String?
    @NSManaged var time: Date?
}
