//
//  TabBarView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                }
            FavItemsView()
                .tabItem {
                    Image(systemName: "heart")
                }
            ShopView()
                .tabItem {
                    Image(systemName: "cart.fill")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }.accentColor(Color("C2"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
