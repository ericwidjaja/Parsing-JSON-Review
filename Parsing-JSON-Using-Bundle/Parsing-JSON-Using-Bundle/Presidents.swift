//  Presidents.swift
//  Parsing-JSON-Using-Bundle
//  Created by Eric Widjaja on 8/3/20.
//  Copyright © 2020 ericW. All rights reserved.

import Foundation

struct Presidents: Codable {
    let number: Int
    let name: String // originally called "president", we will
    let birthYear: Int // use coding keys, the similar with
    let deathYear: Int // birthYear from birth_year...
    let tookOffice: String
    let leftOffice: String
    let party: String
    
    private enum CodingKeys: String, CodingKey {
        case number //It's the same, no need to change
        case name = "president"
        case birthYear = "birth_year"
        case deathYear = "death_year"
        case tookOffice = "took_office"
        case leftOffice = "left_office"
        case party //It's the same, no need to change
    }
}
