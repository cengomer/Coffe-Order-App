//
//  ExtraView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import SwiftUI

struct ExtraView: View {
    let extra: Extra // Use Extra instead of Coffe

    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text(extra.name)
                        .foregroundColor(.black)
                        .font(.subheadline)

                    Text("$\(extra.price)")
                }.padding(.bottom)
            }
            .padding()
            .padding(.top, 50)
            .padding(.leading, -8)
            .frame(width: 150, height: 120, alignment: .leading)
            .background(.white)
            .cornerRadius(12)

            ZStack {
                Image("choco")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .offset(y: -45)
                    .offset(x: 45)
            }

            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("C2"))
                .background(.white)
                .clipShape(Circle())
                .offset(y: 30)
                .offset(x: 45)
        }.frame(width: 150, height: 200)
    }
}


struct ExtraView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraView(extra: Extra(name: "Whipped Cream", price: 23))
    }
}
