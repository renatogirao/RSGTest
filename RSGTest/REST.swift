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
}
