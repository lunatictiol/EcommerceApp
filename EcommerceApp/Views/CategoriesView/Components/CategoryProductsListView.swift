//
//  CategoryProductsListView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct CategoryProductsListView: View {
    @State var category:String
    @ObservedObject var vm = CategoriesViewModel()
    @State var products:[Product]?
    var body: some View {
        NavigationView {
            VStack{
                if let products = products{
                  ScrollView   {
                      LazyVGrid(columns: [GridItem(.flexible(),spacing: 190) , GridItem(.flexible(),spacing: 0) ], spacing:30)  {
                            ForEach(products) { product in
                                
                                ProductCardView(product: product)
                            }
                      }.padding(.horizontal, 100)
                    }
                    
                    
                }
            }.task {
                products = await vm.getcategoryProducts(category: category)
        }
        }
        
    }
        
    
    
}

#Preview {
    CategoryProductsListView(category: "electronics")
}
