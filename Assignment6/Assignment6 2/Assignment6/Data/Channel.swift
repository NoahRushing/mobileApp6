//
//  Channel.swift
//  Assignment5
//
//  Created by Noah Rushing on 10/28/22.
//

import Foundation

struct Channel: Identifiable, Codable {
    let id: UUID
    var name: String
    var messages: Int
}
