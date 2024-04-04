//
//  Inspire_ChallengeTests.swift
//  Inspire ChallengeTests
//
//  Created by Devsoft on 11/15/22.
//

import XCTest
@testable import Inspire_Challenge

final class Inspire_ChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchResponse() throws {
        guard
            let path = Bundle.main.path(forResource: "ImportedData", ofType: "json")
        else { fatalError("Can't find search.json file") }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(PosterModel.self, from: data)
        
        XCTAssertEqual(response.posts.count, 5)
        XCTAssertFalse(response.posts.isEmpty)
        
        let firstIndex = response.posts.first
        
        XCTAssertEqual(firstIndex?.trackingId, "24545331")
        XCTAssertEqual(firstIndex?.created, "2022-10-11T07:23:12Z")
        XCTAssertEqual(firstIndex?.url, "")
        XCTAssertEqual(firstIndex?.isFollowed, false)
        
        let firstIndexReactions = response.posts.first?.reactions
        
        XCTAssertEqual(firstIndexReactions?.count, 3)
        XCTAssertNotEqual(firstIndexReactions?[0].count, 0)
        XCTAssertNotEqual(firstIndexReactions?[1].count, 0)
        XCTAssertNotEqual(firstIndexReactions?[2].count, 0)
    }
    
    let dateFormatter1: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "EEE, d MMM yyyy HH:mm:ss Z"
        return result
    }()

    let dateFormatter2: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "MMM dd, YYYY ' •' hh:mm a"
        return result
    }()

    let dateFormatter3: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "YYYY-MM-DD"
        return result
    }()

    func testDateFromString() throws {

        let string = "2022-10-12T08:23:12Z"

        let date1 : Date = dateFormatter1.date(from: string) ?? Date()
        let date2 : Date = dateFormatter2.date(from: string) ?? Date()
        let date3 : Date = dateFormatter3.date(from: string) ?? Date()
        
        XCTAssertNotNil(date1)
        XCTAssertNotNil(date2)
        XCTAssertNotNil(date3)
        XCTAssertFalse("\(date1)".isEmpty, "\(date1)")
        XCTAssertFalse("\(date1)".isEmpty, "\(date2)")
        XCTAssertEqual("\(date2)", "\(date3)")
        XCTAssertEqual("\(date3)", "\(date3)")
        XCTAssertEqual("\(date1)", "\(date3)")
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
