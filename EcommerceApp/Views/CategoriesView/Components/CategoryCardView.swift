//
//  CatagoryCardView.swift
//  EcommerceApp
//
//  Created by sabiq on 19/02/24.
//

import SwiftUI

struct CategoryCardView: View {
    @State var catagory:String
    
    var body: some View {
        ZStack {
           RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SSecondary"))
            HStack{
                Image(systemName: getCatagoryIcon(catagory:catagory))
                    .foregroundStyle(Color("SPrimary"))
                Text(catagory)
                    .foregroundStyle(Color("SPrimary"))
                    .bold()
                Spacer()
                Image(systemName: "arrowshape.right.circle")
                    .foregroundStyle(Color("SPrimary"))
            }.padding()
        }.frame(width: .infinity,height: 40)
            .padding()
            
    }
}

func getCatagoryIcon(catagory:String)->String{
  //  ["electronics","jewelery","men's clothing","women's clothing"]
    
    switch catagory{
    case "electronics":
        return "lightbulb.fill"
    case "jewelery":
        return "sparkles"
    case "men's clothing":
        return "eyes.inverse"
    case "women's clothing":
        return "mouth.fill"
        
    default:
        return "house"
        
    }
    
    
}


#Preview {
    CategoryCardView(catagory: "women's clothing")
}


