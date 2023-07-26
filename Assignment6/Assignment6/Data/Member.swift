//
//  Member.swift
//  Assignment5
//
//  Created by Noah Rushing on 10/29/22.
//

import Foundation

struct Member: Identifiable, Codable {
    let id: UUID
    let name: String
    let accessToken: String
}
