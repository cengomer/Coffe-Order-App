//
//  CartItemsView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import Foundation


class CartItemsView: ObservableObject {
    @Published var cartItems = [Coffe]()
    
    var total: Int {
        if cartItems.count > 0 {
            return cartItems.reduce(0) { $0 + $1.coffeePrice }
        } else {
            return 0
        }
    }
    func addToCart(item: Coffe) {
        cartItems.append(item)
    }
    
    func removeFromCart(item: Coffe) {
        if let index = cartItems.firstIndex(of: item) {
            cartItems.remove(at: index)
        }
    }
}
