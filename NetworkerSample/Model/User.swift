//
//  User.swift
//  NetworkerSample
//
//  Created by Sajith Konara on 24/7/23.
//

import Foundation

struct User: Codable {
    let createdAt, name: String
    let avatar: String
    let id: String
}

typealias Users = [User]
