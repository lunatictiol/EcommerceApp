//
//  ProductCardView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ProductCardView: View {
    @State var product:Product?
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ZStack(alignment:.bottomTrailing ){
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color("SSecondary"))
            VStack(alignment:.leading){
                AsyncImage(url: URL(string:product?.image ?? ""),content: { Image in
                    Image.resizable()
                        .clipped()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 155,height: 160)
                Text(product?.title ?? "").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .font(.headline)
                Text(product?.category ?? "")
                    .font(.caption)
                Text("$\(String(product?.price ?? 00))")
                    .bold()
                HStack(spacing:0){
                    ForEach(1...ratings(rate: product?.rating.rate ?? 1) ,id:\.self){_ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color("SPrimary"))
                        
                    }
                    
                    
                }
               
 
                
            }.padding()
            Button(action: {
                if let product = product{
                    let cart = Cart(title: product.title, price: product.price, category: product.category, image: product.image)
                    context.insert(cart)
                }
                
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 35,height: 35)
                    .foregroundStyle(Color("SPrimary"))
                    .padding()
            })
            
        }
        .frame(width: 150,height: 260)
    }
}






#Preview {
    ProductCardView(product: Product(id: 1, title: "title", price: 22, description: "dddd", category: "cat", image: "",
                                     rating: Rating(rate: 0.6, count: 2)))
}
