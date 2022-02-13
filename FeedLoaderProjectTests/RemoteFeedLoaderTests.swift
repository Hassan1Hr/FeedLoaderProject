//
//  FeedLoaderProjectTests.swift
//  FeedLoaderProjectTests
//
//  Created by mac on 15/01/2022.
//

import XCTest
@testable import FeedLoaderProject

class RemoteFeedLoader{
    
    let client: HTTPClient
    init(client: HTTPClient){
        self.client = client
    }
    func load(){
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient{
    
    func get (from url : URL)
    
}

class HTTPClientSpy: HTTPClient{
    
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    
    func test_init_doesNotReqquestDataFromURL() throws {
        
        let client = HTTPClientSpy()
       
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL )
    }

    func test_load_requestDataFromURL()  {
        
        let client = HTTPClientSpy()
       
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL )
    }

}
