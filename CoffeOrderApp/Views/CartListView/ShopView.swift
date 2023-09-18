//
//  ShopView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var cart: CartItemsView

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    Text("My Cart")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.bottom)
                        
                    
                    ForEach(cart.cartItems) { item in
                        CartView(order: item)
                    }
                    
                 
                    
                    
                } .padding(.top , 50)
            }
            ZStack {
                HStack {
                    Text("$\(cart.total)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Buy Now")
                            .frame(width: UIScreen.main.bounds.width / 3, height: 40)
                            .foregroundColor(.white)
                            .background(Color("C3"))
                            .cornerRadius(6)
                    }

                }
                .padding()
                .frame(height: 100)
                .background(Color("C1"))
                .shadow(radius: 10)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
