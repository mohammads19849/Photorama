//
//  FilckerAPI.swift
//  Photorama
//
//  Created by 09107110225 on 2/29/1396 AP.
//  Copyright © 1396 Mohammad_Salimi. All rights reserved.
//

import Foundation


enum Method:String{
    case interestingPhoto = "flickr.interestingness.getList"
}



struct FilckerAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "496345548e15db3e63f7a475074812f4"
    
    
    
    static var interestingPhotoURL : URL{
        return fickerURL(method: .interestingPhoto, parameters: ["extras":"url_h,date_taken"])
    }
    
    private static func fickerURL(method: Method, parameters: [String: String]?)->URL{
        
        var component = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method" : method.rawValue,
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key" : apiKey
        ]
        
        for (key, value) in baseParams{
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additiinalItems = parameters{
            for (key, value) in additiinalItems{
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        component.queryItems = queryItems
        return component.url!
    }

    
    
    
    
}



