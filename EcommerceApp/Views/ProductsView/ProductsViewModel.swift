//
//  ProductsViewModel.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import Foundation
final class ProductsViewModel:ObservableObject{
    func getUsers() async{
        do{
            let products = try await WebServicesManager.getProducts()
            print(products)
            
        }
        catch(let error){
            print(error.localizedDescription)
            
            
        }
        
    }
    
    
}
