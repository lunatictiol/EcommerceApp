//
//  WebServicesManager.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import Foundation

final class WebServicesManager{

    static func getProducts() async throws ->[Product]{
        guard let url = URL(string: "\(Constants.baseUrl)products") else{
            throw ErrorCases.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response   = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidData
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Product].self, from: data)
        }catch{
            throw ErrorCases.invalidData
        }
        
    }
    static func getImagesForSlider() async throws ->[Images]{
        guard let url = URL(string: "\(Constants.baseUrl)products?limit=5") else{
            throw ErrorCases.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response   = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidData
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Images].self, from: data)
        }catch{
            throw ErrorCases.invalidData
        }
        
    }
    
    
    static func getCategories() async throws ->[String]?{
        guard let url = URL(string: "\(Constants.baseUrl)products/categories") else{
            throw ErrorCases.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response   = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidData
        }
        do {
           
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String]
        }catch{
            throw ErrorCases.invalidData
        }
        
    }
    static func getCategoryProducts(category:String) async throws ->[Product]{
        guard let url = URL(string: "\(Constants.baseUrl)products/category/\(category)") else{
            throw ErrorCases.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response   = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidData
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Product].self, from: data)
        }catch{
            throw ErrorCases.invalidData
        }
        
    }
    
    
    
    
    
}
