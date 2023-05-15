//
//  RemoteFeedLoader.swift
//  FeedLoaderProject
//
//  Created by mac on 13/02/2022.
//

import Foundation

public enum RemoteFeedLoaderError: Error {
    case connectivity
    case invalidData
}

public typealias RemoteFeedLoaderResult = Result<[FeedItem], RemoteFeedLoaderError>

public class RemoteFeedLoader{
    
    private let client: HTTPClient
    private let url: URL
    
    public init(url: URL, client: HTTPClient){
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (RemoteFeedLoaderResult) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success(data, response):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    completion(.success(items))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
    
}
