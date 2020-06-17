//
//  REST.swift
//  RSGTest
//
//  Created by Renato Savoia Girão on 06/03/20.
//  Copyright © 2020 Renato Savoia Girão. All rights reserved.
//

import Foundation
import UIKit

class REST {
    
    private static let basepath = "https://https://api.github.com/search/repositories?q=language:swift&sort=stars"

    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        config.timeoutIntervalForRequest = 40.0
        return config
    }()

    private static let session = URLSession(configuration: configuration)
    
    class func loadRepositories() {
        guard let url = URL(string: basepath)  else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
         
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    
                    guard let data = data else {return}
                    let repositories = try JSONDecoder().decode([Repository].self, from: data)
                    for repository in repositories {
                        print(repository.name)
                    }
                    
                } else {
                    //TODO: alerta de erro do servidor
                }
                
            } else {
                    //TODO: do error alert
                
            }
        }
        dataTask.resume()
        
    }
}
