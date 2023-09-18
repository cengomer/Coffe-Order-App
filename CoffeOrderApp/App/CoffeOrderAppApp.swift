//
//  CoffeOrderAppApp.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

@main
struct CoffeOrderAppApp: App {
    @StateObject var viewModel = OrderListViewModel()
    @StateObject var offer = FavView()
    @StateObject var offer2 = CartItemsView()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(offer)

                .environmentObject(viewModel)
                .environmentObject(offer2)

        }
    }
}
