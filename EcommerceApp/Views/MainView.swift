//
//  ContentView.swift
//  EcommerceApp
//
//  Created by sabiq on 17/02/24.
//

import SwiftUI

struct MainView: View {
    @State var currentTab:Tab = .Home
    @Namespace var animation
    @State private var productViewModel  = ProductsViewModel()
    @State private var categoryViewModel = CategoriesViewModel()
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            ProductsView()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight:.infinity)
                .background()
                .tag(Tab.Home)
                .tint(Color("SPrimary"))
                .environmentObject(productViewModel)
         CategoriesView()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight:.infinity)
                .background()
                .tint(Color("SPrimary"))
                .tag(Tab.Catagories)
                .environmentObject(categoryViewModel)
            
      
            
         Text("Cart")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight:.infinity)
                .background()
                .tag(Tab.Cart)
            
        }.overlay(
            HStack(alignment:.bottom,spacing:0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    TabButton(tab:tab)
                    
                }.padding(.vertical)
                    .padding(.bottom,getSafeArea().bottom == 0 ? 5 :(getSafeArea().bottom - 15))
                    .background(Color("SSecondary"))
                
            },
            alignment: .bottom
            
        )
        .ignoresSafeArea(.all, edges: .bottom )
        
        
    }
    
    func TabButton(tab:Tab) -> some View{
        GeometryReader{proxy in
            Button {
                withAnimation(.spring()){
                    currentTab = tab
                }
            } label: {
                VStack(spacing:0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundStyle(Color("SPrimary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                
                                if currentTab == tab{
                                    MaterialEffect(style: .light)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    Text(tab.TabName)
                                        .foregroundStyle(.pink)
                                        .font(.footnote)
                                        .padding(.top,45)
                                        
                                        
                                    
                                    
                                }
                                
                                
                            }
                        ).contentShape(Rectangle())
                        .offset(y:currentTab == tab ? -15 : 0)
                        
                        
                    
                    
                }
            }

            
        }.frame(height:25)
            
        
    }
    
    
}

#Preview {
    MainView()
}


enum Tab : String, CaseIterable{
    case Home   = "house"
    case Catagories = "list.bullet.circle"
   
    case Cart   = "bag"
    
    
    var TabName : String{
        switch self{
        case .Home:
            return "Home"
      
        case .Cart:
            return "Cart"
        case .Catagories:
            return "Catagories"
        }
    
    }
    
}


extension View{
    func getSafeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
        
    }
    
}
struct MaterialEffect: UIViewRepresentable{
    var style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}
