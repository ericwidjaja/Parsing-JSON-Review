//
//  Parsing_JSON_Using_BundleTests.swift
//  Parsing-JSON-Using-BundleTests
//
//  Created by Eric Widjaja on 8/3/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import XCTest
@testable import Parsing_JSON_Using_Bundle //make sure you add this line before doing AAA

/*
 reminder: all test must begin with the word "test" - then do:
 1. Arrange - getting JSON data - check with https://jsonlint.com/ if presidents.json from line 18 and up are valid JSON
 2. Assert -
 3. Act -
 
 */

class Parsing_JSON_Using_BundleTests: XCTestCase {
    
    func testModel() {
        
        //1. Arrange:
        let jsonData = """
        [{
            "number": 1,
            "president": "George Washington",
            "birth_year": 1732,
            "death_year": 1799,
            "took_office": "1789-04-30",
            "left_office": "1797-03-04",
            "party": "No Party"
        },
        {
            "number": 2,
            "president": "John Adams",
            "birth_year": 1735,
            "death_year": 1826,
            "took_office": "1797-03-04",
            "left_office": "1801-03-04",
            "party": "Federalist"
        }
        ]
        """.data(using: .utf8)! //Converting multiliteral String into data using utf8 format, wrapped it up using the '!'
        
        let expectedFirstPresidentName = "George Washington" // We are testing the President Model, arranged it so that the data we are going to recevive back IS actually the name of our first president.
        
        //2. Act: we are act on it by writing the 'do...let...catch"
        do {
            let presidents = try JSONDecoder().decode([President].self, from: jsonData)
        //3. Assert:
//            XCTAssertEqual(expectedFirstPresidentName, presidents[1].name) // we are making the test fail first -> "George Washington" != "John Adams"
            XCTAssertEqual(expectedFirstPresidentName, presidents[0].name) //now the test result is correct -> "George Washington" == "George Washington"
            
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
    
    func testParseJSONFromBundle() {
        // arrange
        let filename = "presidents" //reminder: this file name MUST the same with the project's 'Filename.json' (presidents.json)
        
        let firstBlackPresident = "Barack Obama"
        
        // act
        do {
            let presidents = try Bundle.main.parseJSON(with: filename)
        
        // assert
            XCTAssertEqual(firstBlackPresident, presidents[44].name)
            
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
