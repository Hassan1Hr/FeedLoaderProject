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
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient{
    
    static var shared = HTTPClient()
    
    func get (from url : URL) {}
    
}

class HTTPClientSpy: HTTPClient{
    
    override func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    
    func test_init_doesNotReqquestDataFromURL() throws {
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL )
    }

    func test_load_requestDataFromURL()  {
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL )
    }

}
