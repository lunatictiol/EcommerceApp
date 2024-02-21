//
//  CategoryProductsListView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct CategoryProductsListView: View {
    @State var category:String
    @EnvironmentObject var vm : CategoriesViewModel
   
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack{
              
                  ScrollView   {
                      LazyVGrid(columns: [GridItem(.flexible(),spacing: 190) , GridItem(.flexible(),spacing: 0) ], spacing:50)  {
                          ForEach(vm.categoryProducts) { product in
                                NavigationLink {
                                    ProductsDetailsView(product: product)
                                } label: {
                                    
                                    ProductCardView(product: product)
                                }.tint(.black)

                                
                            }
                      }.padding(.horizontal, 100)
                    }
                    
                    
                
            }.onAppear{
                vm.getcategoryProducts(category: category)
                
            }
            .toolbar{
                ToolbarItem(placement: .navigation) {
                    HStack {
                        Button(action: {
                          dismiss()


                        }, label: {
                          Image(systemName: "chevron.left")
                    })
                     AppBarView()
                        
                    }
                    .padding(.bottom,20)
                }
                
            }
         
        }
        
    }
        
    
    
}

#Preview {
    CategoryProductsListView(category: "electronics").environmentObject(CategoriesViewModel())
}
