//
//  ProductsView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var vm = ProductsViewModel()
    @State var products :[Product]?
    @State var images :[Images]?
    var body: some View {
        NavigationView {
            VStack{
                AppBarView()
                SearchBarView()
                ImageSliderView(slides:images)
          
                HStack{
                    Text("Top Products")
                        .bold()
                    Spacer()
                    Image(systemName: "circle.grid.2x2.fill")
                }.padding(.horizontal)
                ScrollView(.horizontal,showsIndicators: false){
                    if let products = products{
                        
                        HStack(spacing:15){
                            ForEach(products){ product in
                             
                                ProductCardView(product: product )
                                    .padding(.horizontal,6)
                            }
                        }.padding()
                    }
                        
                    
                        
                    
                    
                    
                }
                
                Spacer()
                
            }.task {
                images = await vm.getImages()
                products = await vm.getProducts()
            }
        }
    }
}

#Preview {
    ProductsView()
}
