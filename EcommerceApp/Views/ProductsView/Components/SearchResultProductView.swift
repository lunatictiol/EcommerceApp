//
//  SearchResultProductView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct SearchResultProductView: View {
    @State var searchKey:String
    @EnvironmentObject var vm: ProductsViewModel
    var body: some View {
        VStack{
            if let result = vm.searchResult{
                ProductsDetailsView(product: result)
            }
            else{
                Text("No Product Found")
                
            }
            
            
        }
        .padding()
        .onAppear{
            vm.getproductDetails(searchKey: searchKey)
        }
    }
}

#Preview {
    SearchResultProductView(searchKey: "John Hardy").environmentObject(ProductsViewModel())
}

//
//if let result = vm.searchResult{
//    Text(result.title)
//    
//    
//}
//else{
//    Text("product not found")
//}
