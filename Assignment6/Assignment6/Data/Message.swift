//
//  Message.swift
//  Assignment5
//
//  Created by Noah Rushing on 10/28/22.
//

import Foundation

struct Message: Identifiable, Codable {
    let id: UUID
    let member: UUID
    let content: String
    let posted: String
}
