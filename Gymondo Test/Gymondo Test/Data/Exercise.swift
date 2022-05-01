//
//  Exercise.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import Foundation

// MARK: - ExerciseList
struct ExerciseList: Codable {
    let count: Int
    let next: String
    let results: [Exercise]
}

// MARK: - Result
struct Exercise: Codable {
    let id: Int
    let uuid, name: String
    let exerciseBase: Int
    let resultDescription, creationDate: String
    let category: Int
    let muscles, musclesSecondary, equipment: [Int]
    let language, license: Int
    let licenseAuthor: String
    let variations: [Int]

    enum CodingKeys: String, CodingKey {
        case id, uuid, name
        case exerciseBase = "exercise_base"
        case resultDescription = "description"
        case creationDate = "creation_date"
        case category, muscles
        case musclesSecondary = "muscles_secondary"
        case equipment, language, license
        case licenseAuthor = "license_author"
        case variations
    }
}
