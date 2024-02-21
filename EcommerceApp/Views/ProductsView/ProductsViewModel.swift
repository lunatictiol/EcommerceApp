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
    @Published var searchResult:Product?
 
    init(){
      
            getProducts()
            getImages()
        
    }
    
    func getProducts()   {
        
            Task{
                
                do{
                    
                    let products = try await WebServicesManager.getProducts()
                    DispatchQueue.main.async {
                        self.products = products
                    }
                }
                catch(let error){
                    print(error.localizedDescription)
                }
            }
            
               
            
        
          
        
    }
    
    func getImages() {
        Task{
            
            do{
                let images = try await WebServicesManager.getImagesForSlider()
                DispatchQueue.main.async {
                    self.images = images
                }
            }
            catch(let error){
                print(error.localizedDescription)
            }
        }
            
            
      
        
    }
    
    //need to fix this
    func getproductDetails(searchKey: String) {
        for product in products {
            if product.title.range(of:searchKey) != nil{
                self.searchResult = product
                return
            }
        }
        
        self.searchResult = nil
        
    }
    

    
    
    
    
    
    
}
