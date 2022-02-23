//
//  HTTPClient.swift
//  FeedLoaderProject
//
//  Created by mac on 23/02/2022.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}


public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}
