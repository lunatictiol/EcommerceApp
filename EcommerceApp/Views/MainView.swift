//
//  ContentView.swift
//  EcommerceApp
//
//  Created by sabiq on 17/02/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        @ObservedObject var vm = ProductsViewModel()
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await vm.getUsers()
        }
        
    }
}

#Preview {
    MainView()
}
