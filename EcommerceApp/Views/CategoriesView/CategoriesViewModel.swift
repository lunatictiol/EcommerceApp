//
//  CatagoriesViewModel.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import Foundation
final class CategoriesViewModel:ObservableObject{
    @Published var categories : [String]?
   
    
    init() {
    getcategories()
    }
    
    func getcategories()  {
            Task{
                if  let categories = try await WebServicesManager.getCategories(){
                    
                    self.categories = categories
                }
            }
        
       
        
    }
    func getcategoryProducts(category : String ) async -> [Product] {
        do{
            let categoryProducts = try await WebServicesManager.getCategoryProducts(category: category )
            return categoryProducts
            
        }
        catch(let error){
            print(error.localizedDescription)
            return[]
        }
            
        
       
        
    }
    
}
