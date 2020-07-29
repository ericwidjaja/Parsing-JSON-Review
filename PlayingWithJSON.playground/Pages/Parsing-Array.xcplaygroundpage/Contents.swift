import Foundation

// JSON data

let json = """

[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]

""".data(using: .utf8)!

// create model from JSON

struct City: Codable {
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
}
