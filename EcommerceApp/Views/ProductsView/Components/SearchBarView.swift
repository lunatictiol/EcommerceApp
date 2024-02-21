//
//  SearchTextFieldView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct SearchBarView: View {
    @State  var search:String=""
    @EnvironmentObject var vm:ProductsViewModel
    var body: some View {
        
        
        VStack(alignment:.leading,spacing: 5){
            
                Text("Find The Most \n innovative")
                    .font(.largeTitle)
                    .bold() +
                Text("Products") .font(.largeTitle)
                .bold().foregroundStyle(Color("SPrimary"))
            HStack {
                HStack{
                    Image(systemName: "cart.fill")
                        .foregroundStyle(Color("SPrimary"))
                    TextField("Search Products", text: $search)
                        .foregroundStyle(Color("SPrimary"))
                        .padding()
                    
                }.padding(.horizontal)
                    .background(
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        
                        
                            .foregroundStyle(Color("SSecondary")))
                
                NavigationLink {
                    SearchResultProductView(searchKey: search)
                        .environmentObject(vm)
                } label: {
                    
                    Image(systemName: "magnifyingglass")
                        .background(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width:50,height: 50)
                            
                                .foregroundStyle(Color("SSecondary")))
                        .foregroundStyle(Color("SPrimary"))
                        .padding()
                }

             
                
                
            }
        
            
            
            
        }.padding(.horizontal)
        
        
        
    }
}

#Preview {
    SearchBarView()
}
