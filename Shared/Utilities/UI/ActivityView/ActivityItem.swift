//
//  ActivityItem.swift
//  AnyMindResume
// origin: https://github.com/SwiftUI-Plus/ActivityView
//  Created by Abderrahman Ajid on 15/5/2022.
//

import UIKit

struct ActivityItem {
    
    internal var items: [Any]
    internal var activities: [UIActivity]
    internal var excludedTypes: [UIActivity.ActivityType]
    
    init(items: Any..., activities: [UIActivity] = [], excludedTypes: [UIActivity.ActivityType] = []) {
        self.items = items
        self.activities = activities
        self.excludedTypes = excludedTypes
    }
}
