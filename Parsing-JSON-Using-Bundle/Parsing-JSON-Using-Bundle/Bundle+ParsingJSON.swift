//  Bundle+ParsingJSON.swift
//  Parsing-JSON-Using-Bundle
//  Created by Eric Widjaja on 8/3/20.
//  Copyright © 2020 ericW. All rights reserved.

import Foundation

enum BundleError: Error {           //enum is conforming to Error
    case invalidResource(String)    //let say user passing a wrong/mispelled 'name' as invalid
    case noContents(String)         //resource
    case decodingError(Error)
}

extension Bundle {
    // 1. get the (path) of the file to be read using the Bundle class -> String? (optional String)
    // 2. Using the path -> read it's data contents => Data? (type of data here is optional Data)
    
    // Bundle.main is a singleton
    // parseJSON will be a throwing function
    // to use throwing function you have to use try? or do {} catch {} or try!
    // if we are using the do catch, we need to throw the errors => create 'enum BundleError:...'
    
    func parseJSON(with name: String, ext: String = ".json") throws -> [President] {
        
        //  guard let path = Bundle.main.path(forResource: <#T##String?#>, ofType: <#T##String?#>) else {
        
        guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
            throw BundleError.invalidResource(name)
            // Can't show Alert Controller (bc: we don't import UIKit therefor we have no access to UIController or even putting a print statement here because it's not enough)
        }
        //What class we are going to need to read from the file system? answer => 'FileManager'
        //FileManager.default here is also a singleton
        
        guard let data = FileManager.default.contents(atPath: path) else {
            //            throw BundleError.noContents(<#T##String#>)
            throw BundleError.noContents(path)
            // Similar here with line 27. the path can contains nothing, so we need to throw an error => create 'no content' case inside the BundleError enum
        }
        
        var presidents: [President]
        
        //we now can convert data into swift object with do catch
        
        do {
            presidents = try JSONDecoder().decode([President].self, from: data)
        } catch {
            throw BundleError.decodingError(error)
        }
        
        return presidents
    }
}
