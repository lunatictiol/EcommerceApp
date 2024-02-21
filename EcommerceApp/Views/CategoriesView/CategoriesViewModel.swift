//
//  CatagoriesViewModel.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import Foundation
final class CategoriesViewModel:ObservableObject{
    @Published var categories       = [String] ()
    @Published var categoryProducts = [Product]()
    
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
    func getcategoryProducts(category : String ) {
      
            Task{
                
                do{
                    let categoryProducts = try await WebServicesManager.getCategoryProducts(category: category )
                    DispatchQueue.main.async {
                        self.categoryProducts = categoryProducts
                    }
                }
                    catch(let error){
                        print(error.localizedDescription)
                        
                    }
                }
                
            }
            

          
        
       
        
    }
    

