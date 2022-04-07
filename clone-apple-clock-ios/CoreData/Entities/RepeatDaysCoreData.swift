//
//  RepeatDaysCoreData.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/03/22.
//

import Foundation
import CoreData

class RepeatDaysCoreData: NSManagedObject {
    @NSManaged var days: [String]?
}
