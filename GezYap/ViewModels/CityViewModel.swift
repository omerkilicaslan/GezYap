//
//  CityViewModel.swift
//  GezYap
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2023.
//

import Foundation
import SwiftUI

class CityViewModel: ObservableObject {
    
    @Published var allCityData: [City] = [
        City(name: "İstanbul", activities: ["Boğaz turu", "Ayasofya ziyareti"], foods: ["İskender", "Baklava"], isTraveled: false),
        City(name: "Paris", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: false),
        City(name: "New York", activities: ["Central Park", "Times Meydanı"], foods: ["Hot dog", "Cheesecake"], isTraveled: false),
        City(name: "Ankara", activities: ["Boğaz turu", "Ayasofya ziyareti"], foods: ["İskender", "Baklava"], isTraveled: false),
        City(name: "Trabzon", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: false),
        City(name: "Van", activities: ["Central Park", "Times Meydanı"], foods: ["Hot dog", "Cheesecake"], isTraveled: false),
        City(name: "Kilis", activities: ["Boğaz turu", "Ayasofya ziyareti"], foods: ["İskender", "Baklava"], isTraveled: false),
        City(name: "Urfa", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: false),
        City(name: "Kars", activities: ["Central Park", "Times Meydanı"], foods: ["Hot dog", "Cheesecake"], isTraveled: false),
        City(name: "Muş", activities: ["Boğaz turu", "Ayasofya ziyareti"], foods: ["İskender", "Baklava"], isTraveled: false),
        City(name: "Düzce", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: false),
        City(name: "Yalova", activities: ["Central Park", "Times Meydanı"], foods: ["Hot dog", "Cheesecake"], isTraveled: false)
    ]
    
    func deleteItem(indexSets: IndexSet){
            allCityData.remove(atOffsets: indexSets)
        }
    
    func addItemToTheEnd(city: City) {
        allCityData.insert(city, at: allCityData.endIndex)
    }
    
    func moveCityToLast(_ city: City) {
            if let index = allCityData.firstIndex(where: { $0.name == city.name }) {
                allCityData.remove(at: index)
                allCityData.append(city)
                
                allCityData.sort { $0.name < $1.name } // Alfabetik sıralama
            }
        }
}
