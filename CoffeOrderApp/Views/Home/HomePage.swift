//
//  HomePage.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var viewModel: OrderListViewModel

    var body: some View {
        
            NavigationStack {
                
                ZStack{
                    Color.white
                    
                 
                    
                    ZStack{
                        Color("C2")
                        ZStack {
                            VStack(alignment: .leading , spacing: 20){
                                Text("Best Coffe in Town")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                HStack(spacing:25){
                                    Text("Cofee")
                                        .foregroundColor(.white)
                                    Text("Tea")
                                    Text("Drink")
                                }                                        .font(.headline)
                                    .foregroundColor(Color(.systemGray5))
                                    .fontWeight(.bold)

                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .padding(.top , 100)
                        }
                    }
                    .clipShape(Capsule())
                    .frame(width: 400, height: 700)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .offset(y:-250)
                    .ignoresSafeArea()
                    
                    ZStack {
                        
                        ScrollView(.horizontal , showsIndicators: false) {
                            HStack(spacing:-5){
                                ForEach( viewModel.orderData) { order in
                                    NavigationLink{
                                        DetailedCoffeView(order: order)
                                    }label: {
                                        SingleItemView(size: CGSize(width: 160, height: 200), size2: CGSize(width: 180, height: 350), isFavourite: true , offsetX: 40 , offsetY: -60, order: order)
                                    }
                                   
                                    
                                }
                            }
                        }
                    }.padding(.bottom , 110)
                        
                    
                    VStack(alignment:.leading){
                        Text("Most Populer")
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                        ScrollView(.horizontal , showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.orderData.suffix(5)) { order in
                                    NavigationLink {
                                        DetailedCoffeView(order: order)
                                    } label: {
                                        SingleItemView(size: CGSize(width: 160, height: 140), size2: CGSize(width: 120, height: 200), isFavourite: false, offsetX: 50, offsetY: -40, order: order)
                                    }
                                }
                            }.padding(.horizontal)

                        }
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom , 90)
                    
                    
                    
                    
                    
                    
                }.ignoresSafeArea()
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image(systemName: "line.3.horizontal")
                                .font(.title2)
                                .foregroundColor(Color("C1"))
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "magnifyingglass")
                                .font(.title3)
                                .foregroundColor(Color("C1"))
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "cart.fill")
                                .font(.title3)
                                .foregroundColor(Color("C1"))
                        }
                    }
            }
        
            
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage().environmentObject(OrderListViewModel())
    }
}
