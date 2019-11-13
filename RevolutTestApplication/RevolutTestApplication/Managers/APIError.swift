//
//  APIError.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 27/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case other(String?)
    case noInternetConnection
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .other(let message): return message ?? ""
        case .noInternetConnection: return NSLocalizedString("alert.noInternetConnection", comment: "")
        }
    }
}
