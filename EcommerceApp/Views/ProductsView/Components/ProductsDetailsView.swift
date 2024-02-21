//
//  ProductsDetailsView.swift
//  EcommerceApp
//
//  Created by sabiq on 20/02/24.
//

import SwiftUI

struct ProductsDetailsView: View {
    @State var product:Product
    var body: some View {
        ScrollView(showsIndicators:false) {
            VStack(alignment:.leading){
              
               
               
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string:product.image), content: { image in
                            
                            image
                                .resizable()
                                .scaledToFit()
                        }, placeholder: {
                            ProgressView()
                        })
                        .frame(width:.infinity, height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                }
                  
                HStack{
                    Text(product.title)
                        .bold()
                        .font(.title)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .foregroundStyle(Color("SPrimary"))
                            .padding()
                    })
                }
                 
                HStack{
                    HStack(spacing:0){
                        ForEach(1...ratings(rate: product.rating.rate) ,id:\.self){_ in
                            Image(systemName: "star.fill")
                                .foregroundStyle(Color("SPrimary"))
                            
                        }
                        
                        
                    }
                        
                    Spacer()
                    Text("$\(String(product.price))")
                    
                }
              
                Text("Description")
                    .font(.title3)
                    .bold()
                Text(product.description)
                Spacer()
            }.frame(width: .infinity)
                .padding()
        }
    }
}

#Preview {
    ProductsDetailsView(
        product: Product(id: 1, title: "title", price: 22, description: "dddd", category: "cat", image: "",
                                        rating: Rating(rate: 5, count: 2))
    )
}
