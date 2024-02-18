//
//  ProductCardView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ProductCardView: View {
    @State var product:Product?
    
    var body: some View {
        ZStack(alignment:.bottomTrailing ){
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color("SSecondary"))
            VStack(alignment:.leading){
                AsyncImage(url: URL(string:product?.image ?? ""),content: { Image in
                    Image.resizable()
                        .clipped()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 175,height: 160)
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
            Button(action: {}, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 35,height: 35)
                    .foregroundStyle(Color("SPrimary"))
                    .padding()
            })
            
        }
        .frame(width: 185,height: 260)
    }
}

func ratings(rate:Double)->Int{
    switch rate{
    case 1..<2 :
        return 1
    case 2..<3 :
     return 2
    case 3..<4 :
     return 3
    case 4..<4.5 :
     return 4
    case 4.5...5 :
     return 5
    default:
        return 1
        
    }
    
    
}




#Preview {
    ProductCardView(product: Product(id: 1, title: "title", price: 22, description: "dddd", category: "cat", image: "",
                                     rating: Rating(rate: 5, count: 2)))
}
