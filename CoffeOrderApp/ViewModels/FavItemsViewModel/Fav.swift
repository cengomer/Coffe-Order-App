//
//  Fav.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import Foundation


class FavView: ObservableObject {
    @Published var favoriteItems = [Coffe]()
    
    
    func addToFavorites(item: Coffe) {
        favoriteItems.append(item)
    }
    
    func removeFromFavorites(item: Coffe) {
        if let index = favoriteItems.firstIndex(of: item) {
            favoriteItems.remove(at: index)
        }
    }
}



