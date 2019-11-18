//
//  Fetchable.swift
//  Nike
//
//  Created by Jonathan Green on 11/13/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import Foundation

protocol Fetchable {}

extension Fetchable {
    func fetch(request:URLRequest, completionHandler:@escaping (_ data:Data?, _ error:Error?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                 // Handle Error
                completionHandler(nil, error)
                 return
             }
             guard let response = response else {
                 // Handle Empty Response
                 return
             }
            
             guard let data = data else {
                 // Handle Empty Data
                
                 return
             }
            
             completionHandler(data, nil)
             // Handle Decode Data into Model
        }
        task.resume()
    }
}
