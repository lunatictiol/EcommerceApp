//
//  ImageSliderView.swift
//  EcommerceApp
//
//  Created by sabiq on 18/02/24.
//

import SwiftUI
//auto scroll not working


struct ImageSliderView: View {
    @State private var currentIndex:Int = 0
    @ObservedObject var vm = ProductsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomLeading ) {
         
                ZStack(alignment: .trailing){
                     ScrollViewReader{ scrollView in
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                            ForEach(vm.images){ image in
                                AsyncImage(url: URL(string: image.image), content: { image in
                                    
                                    image
                                        .resizable()
                                        .scaledToFit()
                                }, placeholder: {
                                    ProgressView()
                                })
                                .frame(width: 300, height:180)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            }.frame(width: .infinity, height:180)
                        }
                        
                     }
                }
                
//            HStack{
//                ForEach(0..<(vm.images.count ) ,id:\.self){index in
//                    Circle()
//                        .fill(self.currentIndex == index ? Color("SPrimary") : Color("SSecondary") )
//                        .frame(width: 10, height: 10)
//                    
//                }
//                
//            }
                
            
            
        }.padding()
            .frame(width: .infinity, height:180)
            .onAppear{
//                Timer.scheduledTimer(withTimeInterval:3 , repeats: true, block: { timer in
//                    DispatchQueue.main.async {
//                        if self.currentIndex + 1 == vm.images.count {
//                            
//                                            self.currentIndex = 0
//                                        } else {
//                                            self.currentIndex += 1
//                                        }
//                                    }
//                })
            }
        
        
    }
}

#Preview {
    ImageSliderView()
}
