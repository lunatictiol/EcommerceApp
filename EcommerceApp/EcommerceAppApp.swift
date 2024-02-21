//
//  EcommerceAppApp.swift
//  EcommerceApp
//
//  Created by sabiq on 17/02/24.
//

import SwiftUI
import SwiftData


@main
struct EcommerceAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }.modelContainer(for: Cart.self)
    }
}
