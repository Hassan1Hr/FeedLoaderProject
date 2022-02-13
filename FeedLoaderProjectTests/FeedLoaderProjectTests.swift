//
//  FeedLoaderProjectTests.swift
//  FeedLoaderProjectTests
//
//  Created by mac on 15/01/2022.
//

import XCTest
@testable import FeedLoaderProject

class RemoteFeedLoader{
    func load(){
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient{
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class FeedLoaderProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    

}
