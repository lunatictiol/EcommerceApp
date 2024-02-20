//
//  SearchResultProductView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct SearchResultProductView: View {
    @State var searchKey:String
    @ObservedObject var vm=ProductsViewModel()
    var body: some View {
        VStack{
            if let result = vm.searchResult{
                Text(result.title)
                
                
            }
            else{
                Text("product not found")
            }
            
        }.onAppear{
            vm.getproductDetails(searchKey: searchKey)
        }
    }
}

#Preview {
    SearchResultProductView(searchKey: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet")
}
