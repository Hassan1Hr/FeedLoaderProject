//
//  FeedLoader.swift
//  FeedLoaderProject
//
//  Created by mac on 15/01/2022.
//

import Foundation

enum LoadFeedResult{
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader{
    func load(complition: @escaping (LoadFeedResult) -> Void)
}
