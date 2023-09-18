//
//  Coffe.swift
//  CoffeOrderApp
//
//  Created by omer elmas on 31.07.2023.
//

import Foundation


struct Coffe: Identifiable , Codable , Equatable{
    
    
        let id : Int
        let image: String
        let coffeeName: String
        let coffeePrice: Int
        let rate: Int
        let numberOfReviews: Int
        let description: String
        let addExtra: [Extra]
}
struct Extra: Codable , Identifiable , Equatable {
    let id = UUID() 
    let name: String
    let price: Int
}


class OrderListViewModel: ObservableObject {
    @Published var orderData: [Coffe] = []
    
    init() {
        if let fileURL = Bundle.main.url(forResource: "coffe", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                orderData = try decoder.decode([Coffe].self, from: jsonData)
            } catch {
                // Handle error if JSON decoding fails
                print("Error decoding JSON data: \(error.localizedDescription)")
            }
        } else {
            print("coffe.json file not found.")
        }
    }
}

