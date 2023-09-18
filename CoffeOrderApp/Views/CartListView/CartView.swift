//
//  CartView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartItemsView
    let order : Coffe

    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment:.leading) {
                    Text(order.coffeeName)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("$\(order.coffeePrice)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "minus")
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color("C1").opacity(0.1))
                            .clipShape(Circle())
                        
                        
                        Text("0")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("C1"))
                            .offset(x:-3)
                        
                        Image(systemName: "plus")
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color("C1").opacity(0.1))
                            .clipShape(Circle())
                        
                        
                    }
                    
                    
                }.offset(x:50)
            }
            
            .frame(width: 350, height: 150)
            .background(Color("C3"))
            .cornerRadius(25)
            .zIndex(0)
            
            ZStack {
                Image(order.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200 , height: 250)
                    .zIndex(1)
                    .offset(x:-80 , y:-210)
                
                
                Image(systemName: "trash")
                    .imageScale(.large)
                    .foregroundColor(.red)
                    .padding(10)
                    .background(Color("C1"))
                    .clipShape(Circle())
                    .rotationEffect(.degrees(25))
                    .offset(x:160 , y:-275)
                    .onTapGesture {
                        withAnimation{
                            cart.removeFromCart(item: order)
                        }
                    }
                
            }
        }
        .padding(.bottom , -200)
        
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(order: Coffe(id: 1, image: "coffe5", coffeeName: "Cafe Latte", coffeePrice: 12, rate: 3, numberOfReviews: 213, description: "Nice Coffe", addExtra: [Extra(name: "none", price: 0)]))
            
    }
}
