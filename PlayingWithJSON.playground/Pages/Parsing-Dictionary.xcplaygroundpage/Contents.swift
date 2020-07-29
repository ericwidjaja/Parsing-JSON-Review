//Parsing Dictionary

//1.add 'import Foundation'
import Foundation

/*2. let json = """
 
<insert your JSON here>
 
""".data(.using: .utf8)
*/

let json = """

{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

// 3. Create model(s) from JSON

/*
 Codable: Decodable & Encodable
 Decodable -> converts json into data
 Encodable -> converts into json data to e.q. POST to a web API
 
 look at line 15 ==> Top Level JSON is a Dictionary because it starts with a '{'
 */

struct ResultWrapper: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    let firstName: String
    let lastName: String
}
/*  ==================================================================================
            4. decode the JSON data into our Swift model
    ==================================================================================
*/
do {
    let dictionary = try JSONDecoder().decode(ResultWrapper.self, from: json)
    let contacts = dictionary.results //[Contact]
    dump(contacts)
    
} catch {
    
    print("decoding error: \(error)")
    
}
