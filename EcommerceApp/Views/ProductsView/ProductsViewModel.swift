//
//  ProductsViewModel.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import Foundation
final class ProductsViewModel:ObservableObject{
    @Published var products = [Product]()
    @Published var images = [Images]()
 
    init(){
      
            getProducts()
            getImages()
        
    }
    
    func getProducts()   {
        
            Task{
                let products = try await WebServicesManager.getProducts()
                DispatchQueue.main.async {
                    self.products = products
                }
            }
            
               
            
        
          
        
    }
    
    func getImages() {
        Task{
            let images = try await WebServicesManager.getImagesForSlider()
            DispatchQueue.main.async {
                self.images = images
            }
        }
            
            
      
        
    }
    

    
    
    
    
    
    
}
