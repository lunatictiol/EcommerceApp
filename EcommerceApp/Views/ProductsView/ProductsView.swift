//
//  ProductsView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var vm = ProductsViewModel()
  
 
    var body: some View {
        NavigationView {
            VStack{
                AppBarView()
                SearchBarView()
                ImageSliderView()
                
               
                HStack{
                    Text("Top Products")
                        .bold()
                    Spacer()
                    Image(systemName: "circle.grid.2x2.fill")
                }.padding(.horizontal)
                ScrollView(.horizontal,showsIndicators: false){
                   
                        
                        HStack(spacing:40){
                            ForEach(vm.products){ product in
                             
                                ProductCardView(product: product )
                                    .padding(.horizontal,6)
                            }
                        }.padding()
                    
                        
                    
                        
                    
                    
                    
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ProductsView()
}
