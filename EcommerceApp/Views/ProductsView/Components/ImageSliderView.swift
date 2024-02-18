//
//  ImageSliderView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
     var slides : [Images]?
    
    var body: some View {
        ZStack(alignment: .bottomLeading ) {
            if let slides = slides{
                ZStack(alignment: .trailing){
                    
                    AsyncImage(url: URL(string: slides[currentIndex].image), content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                        
                        
                    }, placeholder: {
                        ProgressView()
                        
                    })
                    .frame(width: .infinity, height:180)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    
                }
                
                HStack{
                    ForEach(0..<slides.count ,id:\.self){index in
                        Circle()
                            .fill(self.currentIndex == index ? Color("SPrimary") : Color("SSecondary") )
                            .frame(width: 10, height: 10)
                        
                    }
                    
                }
                
            }
            else{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: .infinity, height:180)
                    .foregroundStyle(Color("SSecondary"))
                    .overlay {
                        ProgressView()
                    }
                
            }
            
        }.padding()
            .onAppear{
                Timer.scheduledTimer(withTimeInterval:5 , repeats: true, block: { timer in
                    if self.currentIndex + 1 == 5{
                        self.currentIndex = 0
                    }
                    else{
                        self.currentIndex += 1
                    }
                })
            }
        
        
    }
}

#Preview {
    ImageSliderView()
}
