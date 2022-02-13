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
    let url: URL
    
    init(url: URL, client: HTTPClient){
        self.client = client
        self.url = url
    }
    func load(){
        client.get(from: url)
    }
}

protocol HTTPClient{
    
    func get (from url : URL)
    
}



class RemoteFeedLoaderTests: XCTestCase {

    
    func test_init_doesNotReqquestDataFromURL() throws {
        
        let (_,client) = makeSut()
        
        XCTAssertNil(client.requestedURL )
    }

    func test_load_requestDataFromURL()  {
        let url = URL(string: "https://a-given-url.com")!
        let (sut,client) = makeSut(url: url)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL )
    }
    
    // MARK: - Helpers
    
    
    private func makeSut(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy){
        let client = HTTPClientSpy()
        
        let sut = RemoteFeedLoader(url:url, client: client)
        return(sut,client)
    }

    private class HTTPClientSpy: HTTPClient{
        
        func get(from url: URL) {
            requestedURL = url
        }
        
        var requestedURL: URL?
    }
}
