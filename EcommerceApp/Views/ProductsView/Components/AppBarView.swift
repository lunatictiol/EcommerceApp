//
//  AppBarView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct AppBarView: View {
    var body: some View {
       
            HStack{
                Image(systemName: "location.north.fill")
                Text("Kashmir,India")
                    .foregroundStyle(.gray)
                    .font(.title2)
                Spacer()
                

                
            }.padding(.horizontal)
        
    }
}

#Preview {
    AppBarView()
}
