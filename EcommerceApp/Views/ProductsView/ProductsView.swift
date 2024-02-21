//
//  ProductsView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var vm : ProductsViewModel
  
 
    var body: some View {
        NavigationView {
            VStack{
                AppBarView()
                SearchBarView()
                    .environmentObject(vm)
                ImageSliderView()
                    .environmentObject(vm)
                
               
                HStack{
                    Text("Top Products")
                        .bold()
                    Spacer()
                    Image(systemName: "circle.grid.2x2.fill")
                }.padding(.horizontal)
                ScrollView(.horizontal,showsIndicators: false){
                   
                        
                        HStack(spacing:40){
                            ForEach(vm.products){ product in
                                NavigationLink {
                                    ProductsDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product )
                                        .padding(.horizontal,6)
                                    
                                }.tint(.black)

                                
                            }
                        }.padding()
                    
                        
                    
                        
                    
                    
                    
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ProductsView().environmentObject(ProductsViewModel())
}
