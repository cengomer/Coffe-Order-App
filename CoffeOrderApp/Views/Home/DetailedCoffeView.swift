//
//  DetailedCoffeView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

struct DetailedCoffeView: View {
    let order : Coffe
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var book: CartItemsView

    var body: some View {
        NavigationView {
            ZStack {
                Color("C2")
                
                VStack(alignment:.leading){
                    Image(order.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 0, height: 300)
                        .background(Color("C2"))
                        .offset(x:15)
                        .padding()
                        .padding(.top)
                    Spacer()
                    
                    
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 400, height: 520)
                        .foregroundColor(Color("C1"))
                    
                    VStack(alignment: .leading){
                        Text(order.coffeeName)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom , 3)
                        HStack(spacing:2){
                            ForEach(0..<5, id: \.self) { index in
                                Image(systemName: index < order.rate ? "star.fill" : "star")
                                    .imageScale(.small)
                                    .foregroundColor(.orange)
                                
                                
                                
                            }
                            HStack {
                                Text("\(order.rate).0")
                                
                                Text("(\(order.numberOfReviews) reviews)")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }.padding(.bottom , 2)
                        
                        
                        Text("\(order.description)")
                            .foregroundColor(.gray)
                            .padding(.bottom , 10)
                        
                        Text("Add Extra")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom , -20)
                       
                            ScrollView(.horizontal , showsIndicators: false){
                                HStack(spacing:40){
                                ForEach(order.addExtra) { extra in
                                    
                                    
                                    ExtraView(extra: extra)
                                    
                                }
                            }
                            }.padding(.bottom , 90)
                        
                        
                        
                        
                    }.padding()
                        .frame(width: 400, height: 450)
                    
                }.frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom , 20)
                
                
                HStack(spacing:12){
                    Button {
                        
                    } label: {
                        HStack {
                            Text("$\(order.coffeePrice)  | ")
                                
                            Image(systemName: "cart.fill")
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 2.7, height: 50)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color("C3"))
                            .cornerRadius(12)
                            .onTapGesture {
                                book.addToCart(item: order)

                            }
                    }
                    
                    
                    Button {
                        
                    } label: {
                        
                            Text("Order Now")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 2.7, height: 50)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color("C3"))
                            .cornerRadius(12)
                        
                            .onTapGesture {
                                withAnimation {
                                    book.addToCart(item: order)

                                }

                            }
                    }

                
                }
                .padding(.horizontal , 45)
                .padding(.top , 10)
                .padding(.bottom , 90)
                .background(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding()

                    
                
            }
            .ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(Color("C1"))
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)

        
        
    }
}

struct DetailedCoffeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCoffeView(order: Coffe(id: 1, image: "coffe3", coffeeName: "Capatcino", coffeePrice: 23, rate: 3, numberOfReviews: 32, description: "Espresso poured over a scoop of ice cream.", addExtra: [Extra(name: "choclate", price: 1)]))
    }
}
