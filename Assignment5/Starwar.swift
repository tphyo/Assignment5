// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Starwar: Codable {
    let count: Int?
    let next: String?
    let previous: JSONNull?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name, height, mass, hair_color: String?
    let skin_color, eye_color, birth_year: String?
    let gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?
}

struct Homeworld: Codable {
    let name, rotation_period, orbital_period, diameter: String?
    let climate, gravity, terrain, surface_water: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?
}

class Film: Codable {
    let title: String?
    let episode_id: Int?
    let opening_crawl, director, producer, release_date: String?
    let characters, planets, starships, vehicles: [String]?
    let species: [String]?
    let created, edited: String?
    let url: String?
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
