//
//  ProductsViewModel.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import Foundation
final class ProductsViewModel:ObservableObject{
    
 
    func getProducts() async -> [Product] {
        do{
            let products = try await WebServicesManager.getProducts()
          
                return products
            
            
        }
        catch(let error){
            
            print(error.localizedDescription)
            return []
            
        }
        
    }
    
    func getImages() async -> [Images]{
        do{
            let images = try await WebServicesManager.getImagesForSlider()
  
                return images
            
            
        }
        catch(let error){
            print(error.localizedDescription)
          return []
        
            
        }
        
    }
    

    
    
    
    
    
    
}
