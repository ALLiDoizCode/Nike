//
//  Constants.swift
//  Nike
//
//  Created by Jonathan Green on 11/13/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import Foundation

func baseURL() throws -> URL {
    guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json") else {
        throw APIError.badURL
    }
    return url
}
