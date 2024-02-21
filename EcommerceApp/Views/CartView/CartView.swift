//
//  CartView.swift
//  EcommerceApp
//
//  Created by sabiq on 21/02/24.
//

import SwiftUI
import SwiftData
struct CartView: View {
    @Environment(\.modelContext) private var context
    @Query private var cart:[Cart]
 
    var body: some View {
        
      
        
        
        
        NavigationView {
            List{
                ForEach(cart){ cart in
                    
                    HStack{
                        AsyncImage(url: URL(string:cart.image), content: { image in
                                
                                image
                                    .resizable()
                                    .scaledToFit()
                            }, placeholder: {
                                ProgressView()
                            })
                            .frame(width:50, height:50)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        VStack(alignment:.leading){
                            Text(cart.title).bold()
                            Text(cart.category).font(.footnote)
                        }
                        Spacer()
                        Button(action: {
                            context.delete(cart)
                        }, label: {
                         Image(systemName: "trash")
                                .tint(.red)
                        })
                    }.padding()
                  
                }
                
            }.navigationTitle("My cart 🛒")
        }
    }
}

#Preview {
    CartView()
}
