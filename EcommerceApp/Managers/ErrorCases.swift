//
//  ErrorCases.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import Foundation

enum ErrorCases:LocalizedError{
    case invalidUrl
    case invalidResponse
    case invalidData
    
    
    var errorDescription: String?{
        switch self{
        case .invalidUrl:
        return "invalid URL"
        case .invalidResponse:
            return "invalid Response"
        case .invalidData:
            return "invalid Data"
        }
    }
    
    
}
