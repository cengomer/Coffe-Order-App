//
//  SingleItemView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

struct SingleItemView: View {
    let size : CGSize
    let size2 : CGSize
    let isFavourite : Bool
    let offsetX : Int
    let offsetY : Int

    @State private var fav = false
    @EnvironmentObject var book: FavView

    var order: Coffe
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                VStack (alignment: .leading){
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.orange)

                        Text("\(order.rate).0")
                            .font(.caption)
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                    
                    Text(order.coffeeName)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                
                HStack {
                    Text("$\(order.coffeePrice)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    if isFavourite {
                        Image(systemName: fav ? "heart.fill" : "heart")
                            .imageScale(.small)
                            .padding(4)
                            .background()
                            .foregroundColor(.red)
                            .clipShape(Circle())
                            .onTapGesture {
                                fav.toggle()
                                if fav {
                                    book.addToFavorites(item: order)
                                } else {
                                    book.removeFromFavorites(item: order)
                                }
                            }
                    }
                }
                
               
            }
            .padding()
            .frame(width: size.width, height: size.height , alignment: .leading)
                .background(Color("C3"))
            .cornerRadius(15)
            
            VStack{
                Image(order.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size2.width , height: size2.height )
                    .offset(x:CGFloat(offsetX))
                    .offset(y:CGFloat(offsetY))
            }
            

        }
        
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleItemView(size: CGSize(width: 160, height: 120), size2: CGSize(width: 120, height: 200), isFavourite: false , offsetX: 50 , offsetY: -30, order: Coffe(id: 1, image: "coffe5", coffeeName: "Capatcino", coffeePrice: 23, rate: 3, numberOfReviews: 32, description: "nothing", addExtra: [Extra(name: "choco", price: 21)]))
    }
}
