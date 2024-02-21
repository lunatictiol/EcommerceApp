//
//  CatagoriesView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct CategoriesView: View {
  
    @EnvironmentObject var vm : CategoriesViewModel
    
    
    var body: some View {
        NavigationView{
            VStack{
                AppBarView()
               
                    ScrollView{
                        ForEach(vm.categories, id: \.self ){category in
                            NavigationLink {
                            CategoryProductsListView(category: category)
                                    .navigationBarBackButtonHidden(true)
                                    .environmentObject(vm)
                            } label: {
                                CategoryCardView(catagory: category)
                            }
                            
                            
                        }
                    }
                    
                Spacer()
            }
            
            
            
        }.task {
           
        }
    }
}

#Preview {
    CategoriesView().environmentObject(CategoriesViewModel())
}
