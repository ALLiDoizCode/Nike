//
//  Album.swift
//  Nike
//
//  Created by Jonathan Green on 11/13/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import Foundation

struct Top_Albums:Codable,Fetchable {
    var feed:Album?
    init() {
        
    }
    func getAlbums(success:@escaping (_ albums:Top_Albums) -> Void, err:@escaping (_ error:Error) -> Void) {
        
        do{
            let request = try Router.topAlbums.request()
            fetch(request: request) { (data, error) in
                guard let data = data else {
                    err(APIError.noData)
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let object = try decoder.decode(Top_Albums.self, from: data)
                    success(object)

                }catch {
                    err(error)
                }
            }
        }catch{
            err(error)
        }
        
    }
}

struct Album:Codable {
    var results:[Result]
}

struct Result:Codable {
    var artistName:String
    var releaseDate:String
    var name:String
    var artworkUrl100:String
    var artistUrl:String
    var copyright:String
}
