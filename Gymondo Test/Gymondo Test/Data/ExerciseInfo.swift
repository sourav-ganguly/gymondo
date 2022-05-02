//
//  ExerciseInfo.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import Foundation


// MARK: - Result
struct ExerciseInfo: Codable {
    let id: Int
    let name, uuid: String
    let exerciseBaseID: Int
    let resultDescription, creationDate: String
    let category: Category
    let muscles, musclesSecondary: [Muscle]
    let equipment: [Category]
    let language, license: Language
    let licenseAuthor: String
    let images: [Image]
    let comments: [Comment]
    let variations: [Int]

    enum CodingKeys: String, CodingKey {
        case id, name, uuid
        case exerciseBaseID = "exercise_base_id"
        case resultDescription = "description"
        case creationDate = "creation_date"
        case category, muscles
        case musclesSecondary = "muscles_secondary"
        case equipment, language, license
        case licenseAuthor = "license_author"
        case images, comments, variations
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
}

// MARK: - Comment
struct Comment: Codable {
    let id, exercise: Int
    let comment: String
}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let uuid: String
    let exerciseBase: Int
    let image: String
    let isMain: Bool
    let status, style: String

    enum CodingKeys: String, CodingKey {
        case id, uuid
        case exerciseBase = "exercise_base"
        case image
        case isMain = "is_main"
        case status, style
    }
}

// MARK: - Language
struct Language: Codable {
    let id: Int
    let shortName, fullName: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case shortName = "short_name"
        case fullName = "full_name"
        case url
    }
}

// MARK: - Muscle
struct Muscle: Codable {
    let id: Int
    let name: String
    let isFront: Bool
    let imageURLMain, imageURLSecondary: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case isFront = "is_front"
        case imageURLMain = "image_url_main"
        case imageURLSecondary = "image_url_secondary"
    }
}

