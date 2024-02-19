//
//  CatagoriesView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct CategoriesView: View {
  
    @ObservedObject var vm = CategoriesViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                AppBarView()
                if let categories = vm.categories {
                    ScrollView{
                        ForEach(categories, id: \.self ){category in
                            NavigationLink {
                            CategoryProductsListView(category: category)
                            } label: {
                                CategoryCardView(catagory: category)
                            }
                            
                            
                        }
                    }
                    } else{
                    ProgressView()
                }
                Spacer()
            }
            
            
            
        }.task {
           
        }
    }
}

#Preview {
    CategoriesView()
}
