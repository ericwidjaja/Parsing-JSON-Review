import Foundation


//      ===================================================
//                  JSON data
//      ===================================================
let json = """

[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    },

    {
        "title": "Long Island City",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.740070,-73.935440"
    }
]

""".data(using: .utf8)!

//          ===================================================
//                      Create model(s)
//          ===================================================


struct City:  Codable {
    let title: String
//  let location_type: String // not a good Swift writing - no camel case
//  Reminder - once property names are changed using the CodingKeys, they must match identically to the case type
    let locationType: String
    let woeid: Int
//    let latt_long: String // no camel case -> needs to be written better with CodingKeys
    let coordinate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        // change line 23 & 26 constant names to match their cases' names ---> "locationType" & "coordinate"
        case woeid
        case coordinate = "latt_long"
    }
}

//          ===================================================
//                  decode JSON to Swift objects
//          ===================================================

do {
    let weatherArray = try JSONDecoder().decode([City].self, from: json)
    dump(weatherArray)
} catch {
    print("decoding error: \(error)")
}
