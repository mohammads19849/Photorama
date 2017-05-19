//
//  PhotoStore.swift
//  Photorama
//
//  Created by 09107110225 on 2/29/1396 AP.
//  Copyright © 1396 Mohammad_Salimi. All rights reserved.
//

import Foundation


class PhotoStore{
    private let session : URLSession={
        let config = URLSessionConfiguration.default
        return URLSession(configuration:config)
    }()
    
    
    func fetchInterestingPhoto(){
        let url = FilckerAPI.interestingPhotoURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error)-> Void in
            if let jsondata = data{
                if let jsonString = String(data: jsondata, encoding: .utf8){
                    print(jsonString)
                }else if let requesterror = error{
                    print("Error fetching interesting photo \(requesterror)")
                }else{
                    print("Unexpected error with the requst")
                }
                
            }
        }
        task.resume()
    }
    
    
    
}
