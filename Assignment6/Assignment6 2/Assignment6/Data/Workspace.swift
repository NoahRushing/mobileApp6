//
//  Workspace.swift
//  Assignment5
//
//  Created by Noah Rushing on 10/28/22.
//




import Foundation

struct Workspace: Identifiable, Codable {
    let id: UUID
    let name: String
    let owner: UUID
    let channels: Int
}
