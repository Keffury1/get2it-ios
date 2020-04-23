//
//  Task+Convenience.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/19/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    // CoreData -> TaskRepresentation -> JSON
    var taskRepresentation: TaskRepresentation? {
        .init(
            taskId: Int(taskId),
            userId: Int(userId),
            name: name ?? "",
            status: status,
            date: date ?? Date(),
            startTime: startTime ?? "",
            endTime: endTime ?? "",
            taskIcon: taskIcon ?? "",
            timeLeft: timeLeft,
            initialNotify: initialNotify,
            notifyOn: notifyOn
        )
    }
    
    // JSON -> TaskRepresentation -> CoreData
    @discardableResult
    convenience init(_ taskRepresentation: TaskRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.taskId = Int64(taskRepresentation.taskId ?? 0)
        self.userId = Int64(taskRepresentation.userId)
        self.name = taskRepresentation.name
        self.status = taskRepresentation.status
        self.date = taskRepresentation.date
        self.startTime = taskRepresentation.startTime
        self.endTime = taskRepresentation.endTime
        self.taskIcon = taskRepresentation.taskIcon
        self.timeLeft = taskRepresentation.timeLeft
        self.initialNotify = taskRepresentation.initialNotify
        self.notifyOn = taskRepresentation.notifyOn
    }
    
    // Updates the task object from task representation
    func apply(_ taskRepresentation: TaskRepresentation) {
        self.taskId = Int64(taskRepresentation.taskId ?? 0)
        self.userId = Int64(taskRepresentation.userId)
        self.name = taskRepresentation.name
        self.status = taskRepresentation.status
        self.date = taskRepresentation.date
        self.startTime = taskRepresentation.startTime
        self.endTime = taskRepresentation.endTime
        self.taskIcon = taskRepresentation.taskIcon
        self.timeLeft = taskRepresentation.timeLeft
        self.initialNotify = taskRepresentation.initialNotify
        self.notifyOn = taskRepresentation.notifyOn
    }
}