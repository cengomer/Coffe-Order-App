//
//  FavItemsView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import SwiftUI

struct FavItemsView: View {
    @EnvironmentObject var offer: FavView

    var body: some View {
        NavigationStack {
            List {
                    ForEach(offer.favoriteItems) { item in
                        Section {
                            ZStack {
                                HStack(spacing:12){
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    
                                    VStack(alignment:.leading){
                                        Text(item.coffeeName)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .lineLimit(1)
                                        Text(item.description)
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .lineLimit(2)
                                        
                                    }
                                    Spacer()
                                    
                                    Text("$\(item.coffeePrice)")
                                        .font(.headline)
                                        .foregroundColor(Color("C3"))
                                }
                            }
                        }
                    }
                
            }
            .navigationTitle("Favorite Coffes")
        }
    }
}

struct FavItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemsView()
            .environmentObject(FavView())
    }
}
