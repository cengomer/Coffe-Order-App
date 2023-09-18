//
//  ProfileView.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 1.08.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("C3")
            VStack {
            
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.gray)
                        .font(.title)
                        .background(.white)
                        .clipShape(Circle())
                    
                    Text("OMER ELAMS")
                        .font(.title2)
                        .foregroundColor(Color("C1"))
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color("C2"))
                .cornerRadius(12)
                .shadow(radius: 5)

                    
                
                
           Text("Dont Forgot Your\nDaily Caffeine dude !")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                
                HStack {
                    Image("coffe1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 644, height: 100)
                        .offset(x:30 , y: 250)
                }
                
            }
        }.ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
